Class {
	#name : #SomNBody,
	#superclass : #SomBenchmark,
	#instVars : [
		'expectedEnergy'
	],
	#category : 'SOM-Benchmarks-NBody'
}

{ #category : #'as yet unclassified' }
SomNBody >> initialize [
	NBBody initialize
]

{ #category : #'as yet unclassified' }
SomNBody >> innerBenchmarkLoop [
	     | bodies |
        bodies := NBNBodySystem new.
        
        1 to: innerIterations do: [:i |
            bodies advance: 0.01.
        ].
        
        innerIterations = 250000 ifTrue: [
          ^ bodies energy = -0.1690859889909308
        ].
        expectedEnergy isNil ifTrue: [
          expectedEnergy := bodies energy.
          ^ true
        ].
        
        ^ expectedEnergy = bodies energy.
]
