Class {
	#name : #SMarkTestRunnerSuiteForPerfromBenchmark,
	#superclass : #SMarkSuite,
	#category : 'SMark-Tests'
}

{ #category : #'as yet unclassified' }
SMarkTestRunnerSuiteForPerfromBenchmark class >> defaultRunner [
	^ SMarkTestRunner
]

{ #category : #'as yet unclassified' }
SMarkTestRunnerSuiteForPerfromBenchmark >> BenchShouldNotBeExecuted [
	"This one should not be executed"
	(Delay forMilliseconds: 5) wait.
	runner didPerform: #BenchShouldNotBeExecuted.
]

{ #category : #'as yet unclassified' }
SMarkTestRunnerSuiteForPerfromBenchmark >> baseBenchmark [
	(Delay forMilliseconds: 5) wait.
	runner didPerform: #baseBenchmark.
]

{ #category : #'as yet unclassified' }
SMarkTestRunnerSuiteForPerfromBenchmark >> benchAfsdfsdfsdf [
	(Delay forMilliseconds: 5) wait.
	runner didPerform: #benchAfsdfsdfsdf.
]

{ #category : #'as yet unclassified' }
SMarkTestRunnerSuiteForPerfromBenchmark >> benchBsdfasereSDSfsdfsdfs [
	(Delay forMilliseconds: 5) wait.
	runner didPerform: #benchBsdfasereSDSfsdfsdfs.
]

{ #category : #'as yet unclassified' }
SMarkTestRunnerSuiteForPerfromBenchmark >> benchC [
	(Delay forMilliseconds: 5) wait.
	runner didPerform: #benchC.
]

{ #category : #'as yet unclassified' }
SMarkTestRunnerSuiteForPerfromBenchmark >> benchZZ [
	(Delay forMilliseconds: 5) wait.
	runner didPerform: #benchZZ.
]
