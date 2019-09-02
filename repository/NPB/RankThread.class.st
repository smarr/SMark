Class {
	#name : #RankThread,
	#superclass : #NPBISBase,
	#instVars : [
		'id',
		'localHist',
		'start',
		'end',
		'rStart',
		'rEnd',
		'state'
	],
	#classVars : [
		'Iteration'
	],
	#category : 'NPB-IS'
}

{ #category : #'instance variables' }
RankThread class >> iteration [
	^ Iteration
]

{ #category : #'instance variables' }
RankThread class >> iteration: val [
	Iteration := val
]

{ #category : #benchmarking }
RankThread class >> newFor: anIS with: id start: s1 end: e1 rStart: s2 rEnd: e2 [
	"create new instance"

	| o |

"RVMOperations print: ('new RankThread: ', id asString, ' ', s1 asString, ' ', e1 asString, ' ', s2 asString, ' ', e2 asString)."

	o := self new.
	
	o initializeValues: anIS.
	
	o master: anIS.
	o id: id.
	o start: s1.
	o end: e1.
	o rStart: s2.
	o rEnd: e2.
	o localHist: (Array new: o maxKey).
	o state: 0.
	
	^o
"setPriority(Thread.MAX_PRIORITY);
setDaemon(true);"
]

{ #category : #accessing }
RankThread >> end: val [
	end := val
]

{ #category : #accessing }
RankThread >> id: val [
	id := val
]

{ #category : #'as yet unclassified' }
RankThread >> initKeys [
	| rng mySeed a x k |
	a := NPBIS amult.
	rng := NPBRandom new.
	mySeed := rng findSeedFor: (id - 1) with: numThreads of: (4 * totalKeys * 1) using: (NPBRandom seed) and: a.
	
	rng seed: mySeed.
	
	k := (maxKey / 4) asInteger.
    
	((start + numKeys) > (end + 1)) ifTrue: [self error: 'this here seems to be inconsistent'.].
	
	start to: end do: [:i |
		x := rng randlc: a.
		x := x + (rng randlc: a).
		x := x + (rng randlc: a).
		x := x + (rng randlc: a).
		keyArray at: i put: (x * k) asInteger.
		]
]

{ #category : #initialization }
RankThread >> initializeValues: anIS [
	numThreads := anIS numThreads.
	maxKey := anIS maxKey.
	
	keyArray := anIS keyArray.
	testIndexArray := anIS testIndexArray.
	masterHist := anIS masterHist.
	partialVerifyVals := anIS partialVerifyVals.
	totalKeys := anIS totalKeys.
	numKeys := (anIS numKeys / anIS numThreads * 1) asInteger.

]

{ #category : #license }
RankThread >> license [
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

{ #category : #accessing }
RankThread >> localHist [
	^localHist 
]

{ #category : #accessing }
RankThread >> localHist: val [
	localHist := val
]

{ #category : #accessing }
RankThread >> rEnd [
	^rEnd
]

{ #category : #accessing }
RankThread >> rEnd: val [
	rEnd := val
]

{ #category : #accessing }
RankThread >> rStart [
	^rStart
]

{ #category : #accessing }
RankThread >> rStart: val [
	rStart := val
]

{ #category : #running }
RankThread >> run [
	[true] whileTrue: [
		"RVMOperations print: 'RankThread waiting id=.', id asString."
		self wait.
		
		self critical: [
			"RVMOperations print: 'RankThread entered run critical Id=', id asString."
					
			(state == #quit)
				ifTrue: [
					master notify. 
					^self
				]
				ifFalse: [
					self perform: state.
					master notify.
				].
		]
	]
]

{ #category : #accessing }
RankThread >> start [
	[self run] fork.
]

{ #category : #accessing }
RankThread >> start: val [
	start := val
]

{ #category : #running }
RankThread >> startStep: aStep [
	self critical: [
		self state: aStep.
		self notify.
	].
]

{ #category : #accessing }
RankThread >> state: val [
	state := val
]

{ #category : #'as yet unclassified' }
RankThread >> step1 [
	"RVMTester print: 'do step 1 '."
	
	keyArray at: (Iteration + 1) put: Iteration.
	keyArray at: (1 + Iteration + (NPBISBase maxIterations)) put: (maxKey - Iteration).
	
	1 to: NPBISBase testArraySize do: [
		:i | partialVerifyVals at: i put: (keyArray at: (1 + (testIndexArray at: i)))].
	
	1 to: maxKey do: [
		:i | localHist at: i put: 0].
	
	start to: end do: [
		:i | localHist at: (1 + (keyArray at: i)) incrementBy: 1].
	
	1 to: (maxKey - 1) do: [
		:i | localHist at: (i + 1) incrementBy: (localHist at: i)]
]

{ #category : #'as yet unclassified' }
RankThread >> step2 [
	"RVMTester print: 'do step 2 '."
	rStart to: rEnd do: [
		:i | 1 to: numThreads do: [
			:j | masterHist at: i incrementBy: ((rankThreads at: j) localHist at: i)]]
]
