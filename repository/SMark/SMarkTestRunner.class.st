Class {
	#name : #SMarkTestRunner,
	#superclass : #SMarkRunner,
	#instVars : [
		'performedBenchmarks',
		'notifyRunnerWasExecuted',
		'setUpCount',
		'tearDownCount',
		'didTearDownBenchC',
		'didSetUpBenchB',
		'baseBenchmarkExecuted'
	],
	#category : 'SMark-Tests'
}

{ #category : #'as yet unclassified' }
SMarkTestRunner >> baseBenchmarkExecuted [
	^ baseBenchmarkExecuted
]

{ #category : #'as yet unclassified' }
SMarkTestRunner >> countSetUpInvoke [
	setUpCount := setUpCount + 1
]

{ #category : #'as yet unclassified' }
SMarkTestRunner >> countTearDownInvoke [
	tearDownCount := tearDownCount + 1
]

{ #category : #'as yet unclassified' }
SMarkTestRunner >> countWasExecuted [
	^ notifyRunnerWasExecuted 
]

{ #category : #'as yet unclassified' }
SMarkTestRunner >> didPerform: aSymbol [
	performedBenchmarks add: aSymbol.
]

{ #category : #'as yet unclassified' }
SMarkTestRunner >> didRunBaseBenchmark [
	baseBenchmarkExecuted := true.
]

{ #category : #'as yet unclassified' }
SMarkTestRunner >> didSetUpBenchB [
	didSetUpBenchB := true.
]

{ #category : #'as yet unclassified' }
SMarkTestRunner >> didTearDownBenchC [
	didTearDownBenchC := true.
]

{ #category : #'as yet unclassified' }
SMarkTestRunner >> hasSetUpBenchB [
	^ didSetUpBenchB.
]

{ #category : #'as yet unclassified' }
SMarkTestRunner >> hasTearDownBenchC [
	^ didTearDownBenchC
]

{ #category : #initialization }
SMarkTestRunner >> initialize [
	super initialize.

	setUpCount := 0.
	tearDownCount := 0.
	notifyRunnerWasExecuted := 0.
	
	baseBenchmarkExecuted := false.

	performedBenchmarks := OrderedCollection new.
]

{ #category : #'as yet unclassified' }
SMarkTestRunner >> isNotifyRunnerWasExecutedSet [
	^ notifyRunnerWasExecuted
]

{ #category : #'as yet unclassified' }
SMarkTestRunner >> notifyRunnerWasExecuted [
	notifyRunnerWasExecuted := notifyRunnerWasExecuted + 1
]

{ #category : #'as yet unclassified' }
SMarkTestRunner >> performedBenchmarks [
	^ performedBenchmarks
]

{ #category : #'as yet unclassified' }
SMarkTestRunner >> setUp [
	notifyRunnerWasExecuted := false
]

{ #category : #'as yet unclassified' }
SMarkTestRunner >> setUpCount [
	^ setUpCount
]

{ #category : #'as yet unclassified' }
SMarkTestRunner >> tearDownCount [
	^ tearDownCount
]
