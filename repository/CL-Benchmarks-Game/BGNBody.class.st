Class {
	#name : #BGNBody,
	#superclass : #Object,
	#instVars : [
		'bodies',
		'afterCnt',
		'collectionFactory',
		'bodyFactory',
		'arrayFactory'
	],
	#category : 'CL-Benchmarks-Game'
}

{ #category : #defaults }
BGNBody class >> defaultProblemSize [
	^ 1000
]

{ #category : #benchmarking }
BGNBody class >> nbody: times [
	"self nbody: 1000"
	^ self nbody: times with: self new
]

{ #category : #benchmarking }
BGNBody class >> nbody: times with: bodies [
	"self nbody: 1000"
   | initEnergy finalEnergy |

	initEnergy := bodies energy.

   times timesRepeat: [bodies after: 0.01d0].
	
	finalEnergy := bodies energy.
	
   ^ {initEnergy. finalEnergy}
]

{ #category : #nbody }
BGNBody >> after: dt [ 
	1 to: bodies size do: [:i|
		i + 1 to: bodies size do: [:j|
			(bodies at: i) and: (bodies at: j) velocityAfter: dt]].

	bodies do: [:t6 | t6 positionAfter: dt]
]

{ #category : #nbody }
BGNBody >> energy [
	| e |
	e := 0.0.
	1 to: bodies size do: [:i | 
		e := e + (bodies at: i) kineticEnergy.
		i + 1 to: bodies size do: [:j |
			e := e - ((bodies at: i) potentialEnergy: (bodies at: j))]
	].
	^ e
]

{ #category : #initialization }
BGNBody >> initialize [
	afterCnt := 0.
	self initializeFactories.
	
	bodies := collectionFactory new add: bodyFactory sun;
				 add: bodyFactory jupiter;
				 add: bodyFactory saturn;
				 add: bodyFactory uranus;
				 add: bodyFactory neptune;
				 yourself.
	
	bodies first offsetMomentum: (bodies
				inject: (arrayFactory with: 0.0 with: 0.0 with: 0.0)
				into: [:m :each | each addMomentumTo: m])
]

{ #category : #initialization }
BGNBody >> initializeFactories [
	collectionFactory := OrderedCollection.
	bodyFactory       := BGBody.
	arrayFactory      := Array.
]
