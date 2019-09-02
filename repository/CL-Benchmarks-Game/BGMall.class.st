Class {
	#name : #BGMall,
	#superclass : #Object,
	#instVars : [
		'guard',
		'maxRendezvous',
		'open',
		'process',
		'queue',
		'cache',
		'pairCache',
		'pairFactory',
		'sharedQueueFactory',
		'orderedCollectionFactory'
	],
	#classVars : [
		'Units'
	],
	#classInstVars : [
		'lastSum'
	],
	#category : 'CL-Benchmarks-Game-ChameneosRedux'
}

{ #category : #'initialize-release' }
BGMall class >> initialize [
   "self initialize"

   Units := #('zero' 'one' 'two' 'three' 'four' 'five' 'six' 'seven' 'eight' 'nine')
]

{ #category : #'initialize-release' }
BGMall class >> new [
   ^self shouldNotImplement
]

{ #category : #accessing }
BGMall class >> units [
   ^Units
]

{ #category : #controlling }
BGMall >> close [
   open := false
]

{ #category : #'initialize-release' }
BGMall >> initialize [
	super initialize.
	self initializeFactories.
   guard := Semaphore forMutualExclusion.
   queue := sharedQueueFactory new.
   cache := orderedCollectionFactory new.
   1 to: 10 do: [:x | cache add: pairFactory new].
]

{ #category : #'initialize-release' }
BGMall >> initializeFactories [
	pairFactory := BGPair.
	sharedQueueFactory := SharedQueue.
	orderedCollectionFactory := OrderedCollection.
]

{ #category : #accessing }
BGMall >> maxRendezvous: max [ 
   maxRendezvous := max
]

{ #category : #private }
BGMall >> obtainPair [
   ^cache removeFirst
]

{ #category : #private }
BGMall >> processVisitors [
   [open] whileTrue: 
         [1 to: maxRendezvous
            do: 
               [:x | 
               | first second |
               first := queue next.
               second := queue next.
               self setPartnersOn: first and: second.
               first signal.
               second signal].
         [queue isEmpty] whileFalse: [queue next signal]].
   process terminate.
   process := nil
]

{ #category : #private }
BGMall >> releasePair: pair [ 
   pair release.
   cache addFirst: pair
]

{ #category : #'initialize-release' }
BGMall >> run [
   open := true.
   process ifNil: 
         [process := [self processVisitors] newProcess.
         process priority: Processor userBackgroundPriority -1 ].
   process resume
]

{ #category : #private }
BGMall >> setPartnersOn: first and: second [
   first partner: second me.
   second partner: first me.

]

{ #category : #private }
BGMall >> shutdown [
   [queue isEmpty] whileFalse: [queue next signal].
   process terminate.
   process := nil
]

{ #category : #controlling }
BGMall >> visitWith: aChameneos [ 
   | pair partner |
   pair := self obtainPair.
   pair me: aChameneos.
   queue nextPut: pair.
   pair wait.
   partner := pair partner.
   self releasePair: pair.
   ^partner
]
