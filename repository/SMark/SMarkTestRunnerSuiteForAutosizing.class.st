Class {
	#name : #SMarkTestRunnerSuiteForAutosizing,
	#superclass : #SMarkSuite,
	#category : 'SMark-Tests'
}

{ #category : #'as yet unclassified' }
SMarkTestRunnerSuiteForAutosizing class >> defaultRunner [
	^ SMarkTestRunner
]

{ #category : #'as yet unclassified' }
SMarkTestRunnerSuiteForAutosizing >> baseBenchmark [
	(Delay forMilliseconds: 5) wait.
]

{ #category : #'as yet unclassified' }
SMarkTestRunnerSuiteForAutosizing >> benchBig [
	(Delay forMilliseconds: 100) wait.
]

{ #category : #'as yet unclassified' }
SMarkTestRunnerSuiteForAutosizing >> benchSmall [
	(Delay forMilliseconds: 5) wait.
]
