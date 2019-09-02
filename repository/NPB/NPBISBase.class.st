"
NPBISBase definines the commonalities for the general benchmark and its actual worker-threads.

See NPBSuite>>benchIS for the actual benchmark implemented based on SMark.

Instance Variables:
	testIndexArray	<Object>
	testRankArray	<Object>
	masterHist	<(SequenceableCollection of: Object)>
	keyArray	<(Array of: (CharacterBlock | Magnitude | Point | String | UUID))>
	partialVerifyVals	<Array>
	sizeClass	<ProtoObject | PseudoContext>
	totalKeys	<Collection | Duration | Number | Point>
	maxKey	<Collection | Duration | Number | Point>
	numBuckets	<ProtoObject | PseudoContext>
	numKeys	<Collection | Color | DateAndTime | Duration | Number | OBMetaNode | Point | Timespan | TraitComposition | TraitDescription | TraitTransformation>
	sizeOfBuffers	<ProtoObject | PseudoContext>
	timerOn	<ProtoObject | PseudoContext>
	timer	<ProtoObject | PseudoContext>
	totalKeysLog2	<ProtoObject | PseudoContext>
	maxKeyLog2	<ProtoObject | PseudoContext>
	numBucketsLog2	<ProtoObject | PseudoContext>
	numThreads	<ProtoObject | PseudoContext>
	rankThreads	<(SequenceableCollection of: RankThread)>
	master	<NPBISBase>
	benchmarkClass	<ProtoObject>
	mtxNotify	<Semaphore>
	mtxCritical	<Semaphore>
"
Class {
	#name : #NPBISBase,
	#superclass : #Object,
	#instVars : [
		'testIndexArray',
		'testRankArray',
		'masterHist',
		'keyArray',
		'partialVerifyVals',
		'sizeClass',
		'totalKeys',
		'maxKey',
		'numBuckets',
		'numKeys',
		'sizeOfBuffers',
		'timerOn',
		'timer',
		'totalKeysLog2',
		'maxKeyLog2',
		'numBucketsLog2',
		'numThreads',
		'rankThreads',
		'master',
		'benchmarkClass',
		'mtxNotify',
		'mtxCritical'
	],
	#classVars : [
		'PassedVerification'
	],
	#category : 'NPB-IS'
}

{ #category : #constants }
NPBISBase class >> S [
	^ Dictionary newFrom: {
		#testIndexArray -> { 48427. 17148. 23627. 62548. 4431 }.
		#testRankArray -> { 0. 18. 346. 64917. 65463 }.
		#totalKeysLog2 -> 16.
		#maxKeyLog2 -> 11.
		#numBucketsLog2 -> 9
	 }
]

{ #category : #constants }
NPBISBase class >> maxIterations [
	^ 10
]

{ #category : #'instance creation' }
NPBISBase class >> newOfSizeClass: aSymbol with: numberOfThreads [ 
	| o |
	o := super new.
	o initializeWithSizeClass: aSymbol andNumberOfThreads: numberOfThreads.
	^o
]

{ #category : #constants }
NPBISBase class >> passedVerification [
	^PassedVerification
]

{ #category : #constants }
NPBISBase class >> passedVerification: val [
	PassedVerification := val
]

{ #category : #constants }
NPBISBase class >> testArraySize [
	^ 5
]

{ #category : #'as yet unclassified' }
NPBISBase >> checksum: intArray name: aString stop: aBool [
	| check |
	
	check := intArray sum.
	1 halt.
	"RVMOperations print: name, ' checksum is ', check asString."
	
	aBool ifTrue: [
		1 halt.
		self StopSystemHere]
]

{ #category : #synchronization }
NPBISBase >> critical: aBlock [
	mtxCritical critical: aBlock
]

{ #category : #initialization }
NPBISBase >> initialize [
	mtxCritical := Semaphore forMutualExclusion.
	mtxNotify := Semaphore new.
]

{ #category : #accessors }
NPBISBase >> initializeValues [
	"initialize the object after construction"
	totalKeys := 1 << self totalKeysLog2.
	maxKey := 1 << maxKeyLog2.
	numKeys := totalKeys.
	sizeOfBuffers := totalKeys.
	keyArray := Array new: sizeOfBuffers.
	masterHist := Array new: maxKey. 
	partialVerifyVals := Array new: NPBISBase testArraySize.
	masterHist doWithIndex: 
		[ :val :i | 
		masterHist 
			at: i
			put: 0 ]
]

{ #category : #initialization }
NPBISBase >> initializeWithSizeClass: aSymbol andNumberOfThreads: numberOfThreads [ 
	| consts |
	benchmarkClass := aSymbol asSymbol.
		
	consts := NPBISBase perform: benchmarkClass.
	consts keysAndValuesDo: 
		[ :key :val | 
		self
			perform: (key , ':') asSymbol
			with: val ].
	numThreads := numberOfThreads.
	
	self initializeValues.
	^ self
]

{ #category : #license }
NPBISBase >> license [
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
NPBISBase >> master [
	^ master
]

{ #category : #accessors }
NPBISBase >> master: val [
	master := val
]

{ #category : #accessors }
NPBISBase >> maxKey [
	^ maxKey
]

{ #category : #accessors }
NPBISBase >> maxKey: val [
	maxKey := val
]

{ #category : #accessors }
NPBISBase >> maxKeyLog2 [
	^ maxKeyLog2 
]

{ #category : #accessors }
NPBISBase >> maxKeyLog2: val [
	maxKeyLog2 := val
]

{ #category : #synchronization }
NPBISBase >> notify [
	mtxNotify signal 
]

{ #category : #accessors }
NPBISBase >> numBuckets [ 
	^ numBuckets
]

{ #category : #accessors }
NPBISBase >> numBuckets: val [
	numBuckets := val
]

{ #category : #accessors }
NPBISBase >> numBucketsLog2 [ 
	^ numBucketsLog2 
]

{ #category : #accessors }
NPBISBase >> numBucketsLog2: val [
	numBucketsLog2 := val
]

{ #category : #accessors }
NPBISBase >> numKeys [
	^ numKeys
]

{ #category : #accessors }
NPBISBase >> numKeys: val [
	numKeys := val
]

{ #category : #accessors }
NPBISBase >> numThreads [
	^ numThreads
]

{ #category : #accessors }
NPBISBase >> numThreads: val [
	numThreads := val
]

{ #category : #accessors }
NPBISBase >> partialVerifyVals [
	^partialVerifyVals 
]

{ #category : #accessors }
NPBISBase >> rankThreads [
	^rankThreads 
]

{ #category : #accessors }
NPBISBase >> rankThreads: val [
	rankThreads := val
]

{ #category : #initialization }
NPBISBase >> setupThreads [
	"Initialize the threads/processes for the benchmark"
	
	| start end remainder offset rStart rEnd rRemainder rOffset rThread |
	
	start := 0. end := 0. remainder := totalKeys \\ numThreads. offset := 0.
	rStart := 0. rEnd := 0. rRemainder := maxKey \\ numThreads. rOffset := 0.
	
	rankThreads := Array new: numThreads.
	
	1 to: numThreads do: [ :i |
		| zeroIdx |
		zeroIdx := i - 1.
		start := (zeroIdx * ((totalKeys / numThreads) asInteger)) + offset.
		end :=  ((zeroIdx * ((totalKeys / numThreads) asInteger))) + ((totalKeys / numThreads) asInteger) - 1 + offset.
		(remainder > 0) ifTrue: [
			remainder := remainder - 1.
			offset := offset + 1.
			end := end + 1].
		
		rStart := (zeroIdx * ((maxKey / numThreads) asInteger)) + rOffset.
		rEnd := ((zeroIdx * ((maxKey / numThreads) asInteger))) + ((maxKey / numThreads) asInteger) -1 + rOffset.
		
		(rRemainder > 0) ifTrue: [
			rRemainder := rRemainder - 1.
			rOffset := rOffset + 1.
			rEnd := rEnd + 1].
		
		rThread := RankThread newFor: self with: i start: (start + 1) end: (end + 1) rStart: (rStart + 1) rEnd: (rEnd + 1).
		rankThreads at: i put: rThread.
		rThread rankThreads: rankThreads.
		rThread start.
	].
]

{ #category : #accessors }
NPBISBase >> sizeOfBuffers [
	^ sizeOfBuffers
]

{ #category : #accessors }
NPBISBase >> sizeOfBuffers: val [
	sizeOfBuffers := val
]

{ #category : #accessors }
NPBISBase >> testIndexArray [
	^ testIndexArray
]

{ #category : #accessors }
NPBISBase >> testIndexArray: val [
	testIndexArray := val
]

{ #category : #accessors }
NPBISBase >> testRankArray [
	^ testRankArray
]

{ #category : #accessors }
NPBISBase >> testRankArray: val [
	testRankArray := val
]

{ #category : #accessors }
NPBISBase >> totalKeys [
	^ totalKeys
]

{ #category : #accessors }
NPBISBase >> totalKeys: val [
	totalKeys := val
]

{ #category : #accessors }
NPBISBase >> totalKeysLog2 [
	^totalKeysLog2
]

{ #category : #accessors }
NPBISBase >> totalKeysLog2: val [
	totalKeysLog2 := val
]

{ #category : #synchronization }
NPBISBase >> wait [
	mtxNotify wait 
]
