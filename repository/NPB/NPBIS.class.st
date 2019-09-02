"
NPBIS definines the general benchmark Integer Sort benchmark of the NAS Parallel Benchmarks.

See NPBSuite>>benchIS for the actual benchmark implemented based on SMark.

Instance Variables:
	bid	<ProtoObject | PseudoContext>
	results	<ProtoObject | PseudoContext>
	serial	<Boolean>
	rng	<NPBRandom>
	runner	<SMarkRunner>
"
Class {
	#name : #NPBIS,
	#superclass : #NPBISBase,
	#instVars : [
		'bid',
		'results',
		'serial',
		'rng',
		'runner'
	],
	#category : 'NPB-IS'
}

{ #category : #constants }
NPBIS class >> amult [
	^1220703125.0
]

{ #category : #constants }
NPBIS class >> defaultProblemSize [
	^ #S
]

{ #category : #'instance creation' }
NPBIS class >> newOfSizeClass: aSymbol with: nThreads serial: aBool [
	| o |
	o := super new.
	
	o initializeWithSizeClass: aSymbol andNumberOfThreads: nThreads.
	
	o serial: aBool.
	o rng: NPBRandom new.
	^o
	
	

]

{ #category : #'as yet unclassified' }
NPBIS >> do: aStep [
	self critical: [
		rankThreads do: [ :thread |
			thread startStep: aStep.].
	
		rankThreads do: [ :ignored | 
			self wait.
		]
	].
]

{ #category : #'as yet unclassified' }
NPBIS >> fullVerify [
	" To save copy and memory sorting can be done directly: "
	| key idx count |
	key := 1. idx := 1.
	
	1 to: numKeys do: [ :i | 
		[ (idx == (masterHist at: key))
		   and: [ ((key >= maxKey)	or: [ idx >= numKeys ]) not ] ] whileTrue: [
			key := key + 1 
		].
		keyArray at: idx put: key.
		idx := idx + 1.
	].

	" Confirm keys correctly sorted: count incorrectly sorted keys, if any "
	count := 0.
	
	2 to: numKeys do: [ :i | 
		((keyArray at: (i - 1)) > (keyArray at: i)) ifTrue: [ count := count + 1]].

	(count ~= 0)
		ifTrue: [ Error signal: 'Full_verify: number of keys out of sort: '. count asString ]
		ifFalse: [ PassedVerification := PassedVerification + 1].
    
    ^ PassedVerification
]

{ #category : #'as yet unclassified' }
NPBIS >> initKeys: aDouble [
	| x k |
	k := maxKey / 4.
	
	1 to: numKeys do: [ :i |
		(i == 32769) ifTrue: [ Transcript show: 'Seed at: ', (rng seed asString);cr.].
		x := rng randlc: aDouble. 
		x := x + (rng randlc: aDouble).
		x := x + (rng randlc: aDouble).
		x := x + (rng randlc: aDouble).
		
		keyArray at: i put: (x * k) asInteger.
		].
]

{ #category : #accessors }
NPBIS >> keyArray [
	^keyArray 
]

{ #category : #license }
NPBIS >> license [
	^'This code is based on the Java version of NPB3.

Permission to use, copy, distribute and modify this software for any purpose
with or without fee is hereby granted. We request, however, that all derived
work reference the NAS Parallel Benchmarks 3.0. This software is provided "as
is" without express or implied warranty.

Information on NPB 3.0, including the Technical Report NAS-02-008
"Implementation of the NAS Parallel Benchmarks in Java", original
specifications, source code, results and information on how to submit new
results, is available at:

   http://www.nas.nasa.gov/Software/NPB/'
]

{ #category : #accessors }
NPBIS >> masterHist [
	^masterHist 
]

{ #category : #'as yet unclassified' }
NPBIS >> partialVerify: iteration [
	| k offset |

	1 to: NPBISBase testArraySize do: [ :i |
		k := partialVerifyVals at: i.
		offset := iteration.
		( (0 <= k) and: [k <= (numKeys - 1)]) ifTrue: [
			(benchmarkClass == #S) ifTrue: [
					((i - 1) <= 2) ifTrue: [ offset := iteration. ]
						    ifFalse: [ offset := 0 - iteration.].
				].
			
			((masterHist at: k) ~= ((testRankArray at: i) + offset))
				ifTrue: [
					Error signal: 'Failed partial verification: iteration ', iteration asString, ', test key ', i asString ]
				ifFalse: [
					NPBISBase passedVerification: (NPBISBase passedVerification + 1). ]
			]
		]
]

{ #category : #'as yet unclassified' }
NPBIS >> rank: iteration [
	keyArray at: (iteration + 1) put: iteration.
	keyArray at: (1 + iteration + (NPBISBase maxIterations)) put: (maxKey - iteration).
	
	1 to: NPBISBase testArraySize do: [
		:i | partialVerifyVals at: i put: (keyArray at: (1 + (testIndexArray at: i)) ) ].
	
	" Clear the work array "
	1 to: maxKey do: [ :i | masterHist at: i put: 0 ].
	
	" In the section, the keys themselves are used as their
	  own indexes to determine how many of each there are: their
	  individual population "
	1 to: numKeys do: [ :i | masterHist at: (1 + (keyArray at: i)) incrementBy: 1 ].
	" Now they have individual key population "
	
	" Density to Distribution conversion "
	1 to: (maxKey - 1) do: [ :i | masterHist at: (i + 1) incrementBy: (masterHist at: i). ].
	
	self partialVerify: iteration.
]

{ #category : #'as yet unclassified' }
NPBIS >> resetMasterHist [
	1 to: maxKey do: [ :i | masterHist at: i put: 0 ].
]

{ #category : #accessors }
NPBIS >> rng: val [
	rng := val
]

{ #category : #'as yet unclassified' }
NPBIS >> run [
	| mainTimer tPhase1 tPhase2 tKeyInit tVerify executionVerified |

	ScriptConsole println: ' Size: ', totalKeys asString, ' Iterations: ', NPBISBase maxIterations asString.
	
	mainTimer := runner createTimer: 'precise-total'.
	tPhase1 := runner createTimer: 'phase1'.
	tPhase2 := runner createTimer: 'phase2'.
	tKeyInit := runner createTimer: 'keyInit'.
	tVerify := runner createTimer: 'verifyCompletely'.
	
	NPBISBase passedVerification: 0.
	
	serial
		ifTrue: [
			tKeyInit start.
			self initKeys: NPBIS amult.
			tKeyInit stop. 
			
			self rank: 1. ]
		ifFalse: [
			self setupThreads.
			
			tKeyInit start.
			self do: #initKeys.
			tKeyInit stop.
			
			RankThread iteration: 1.
			self do: #step1.
			
			self resetMasterHist.
			
			self do: #step2.
			self partialVerify: 1].
		
	NPBISBase passedVerification: 0.
		
	mainTimer start.
		
	1 to: NPBIS maxIterations do: [:i | 
		serial
			ifTrue: [ self rank: i. ]
			ifFalse: [ 
				RankThread iteration: i.
				tPhase1 start.
				self do: #step1.
				tPhase1 stop.
				
				self resetMasterHist.
				
				tPhase2 start.
				self do: #step2.
				tPhase2 stop.
				
				self partialVerify: i]
		].
	
	mainTimer stop.
	
	tVerify start.
	self fullVerify.
	tVerify stop.
	
	executionVerified := ((NPBISBase passedVerification) == ((5 * NPBIS maxIterations) + 1)).
	executionVerified
		ifFalse: [ Error signal: 'Benchmark verification failed'].
		
	serial ifFalse: [ self do: #quit. ].
	^ executionVerified
]

{ #category : #accessors }
NPBIS >> runner: aRunner [
	runner := aRunner
	
]

{ #category : #accessors }
NPBIS >> serial: val [
	serial := val
]
