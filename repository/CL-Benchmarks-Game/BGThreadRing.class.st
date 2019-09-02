Class {
	#name : #BGThreadRing,
	#superclass : #Object,
	#instVars : [
		'threadFactory'
	],
	#category : 'CL-Benchmarks-Game'
}

{ #category : #defaults }
BGThreadRing class >> defaultProblemSize [
	^ 1000
]

{ #category : #'benchmark game' }
BGThreadRing class >> threadring: numHops [
	^ self new threadring: numHops
]

{ #category : #'benchmark game' }
BGThreadRing >> createThreadRing: completionBlock [
	| first last |
	first := nil.
	last  := nil.
   503 to: 1 by: -1 do: [:i |
      first := threadFactory named: i next: first done: completionBlock.
      last isNil ifTrue: [ last := first ].
   ].
   last nextThread: first.
   ^ first
]

{ #category : #'benchmark game' }
BGThreadRing >> initialize [
	threadFactory := BGThread
]

{ #category : #'benchmark game' }
BGThreadRing >> threadring: numHops [
   | done first finalId |
   done  := Semaphore new.

   first := self createThreadRing: [:id | finalId := id.
														 done signal].

   first takeToken: numHops. "start the ring traversal"

   done wait.

   ^ finalId
]
