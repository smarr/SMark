"
One-way constraint solver Benchmark. The main focus in DeltaBlue is on polymorphism and object-oriented programming

To run the benchmark, execute the expression 'SMarkDeltaBlue run'.
"
Class {
	#name : #SMarkDeltaBlue,
	#superclass : #SMarkSuite,
	#category : 'SMark-DeltaBlue'
}

{ #category : #benchmarking }
SMarkDeltaBlue >> benchDeltaBlue [
	"This the combined benchmark."
	
	| n |
	
	n := self problemSize.
	
	DBStrength initialize.
	DBPlanner chainTest: n.
	DBPlanner projectionTest: n.
	^ true
]

{ #category : #defaults }
SMarkDeltaBlue >> defaultProblemSize [
	^ 5000
]

{ #category : #accessing }
SMarkDeltaBlue >> problemSize [
	<omniUnenforced> "Hint for the OMOP that it is part of the meta infrastructure"
	| ps |
	ps := super problemSize.
	
	ps isInteger ifFalse: [	^ self defaultProblemSize].
		
	^ ps
]
