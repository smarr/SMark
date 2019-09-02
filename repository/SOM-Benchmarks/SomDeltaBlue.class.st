Class {
	#name : #SomDeltaBlue,
	#superclass : #SomBenchmark,
	#category : 'SOM-Benchmarks'
}

{ #category : #benchmarking }
SomDeltaBlue >> innerBenchmarkLoop [
	DBStrength initialize.
	DBPlanner chainTest: innerIterations.
	DBPlanner projectionTest: innerIterations.
	^ true
]
