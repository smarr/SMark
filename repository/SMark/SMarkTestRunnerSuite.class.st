"
This is a benchmark suite used to test the benchmark runner
"
Class {
	#name : #SMarkTestRunnerSuite,
	#superclass : #SMarkSuite,
	#category : 'SMark-Tests'
}

{ #category : #'as yet unclassified' }
SMarkTestRunnerSuite class >> isAbstractClass [
	"This is more like a hack, but we do not want to execute this as a benchmark"
	^ true
]

{ #category : #'as yet unclassified' }
SMarkTestRunnerSuite >> benchDoNothing [
	"Just a dummy that should be executed and result in some measured value"
	^ self
]

{ #category : #'as yet unclassified' }
SMarkTestRunnerSuite >> benchNotifyRunner [
	runner notifyRunnerWasExecuted.
	^ self
]
