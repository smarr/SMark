Class {
	#name : #SMarkTestWeakScalingRunner,
	#superclass : #SMarkWeakScalingRunner,
	#instVars : [
		'setUpCount',
		'tearDownCount',
		'notifyRunnerWasExecuted',
		'performedBenchmarks',
		'baseBenchmarkExecuted',
		'didSetUpBenchB',
		'didTearDownBenchC'
	],
	#category : 'SMark-Tests'
}

{ #category : #'as yet unclassified' }
SMarkTestWeakScalingRunner >> baseBenchmarkExecuted [
	^ baseBenchmarkExecuted
]

{ #category : #'as yet unclassified' }
SMarkTestWeakScalingRunner >> countSetUpInvoke [
	setUpCount := setUpCount + 1
]

{ #category : #'as yet unclassified' }
SMarkTestWeakScalingRunner >> countTearDownInvoke [
	tearDownCount := tearDownCount + 1
]

{ #category : #'as yet unclassified' }
SMarkTestWeakScalingRunner >> countWasExecuted [
	^ notifyRunnerWasExecuted 
]

{ #category : #'as yet unclassified' }
SMarkTestWeakScalingRunner >> didPerform: aSymbol [
	performedBenchmarks add: aSymbol.
]

{ #category : #'as yet unclassified' }
SMarkTestWeakScalingRunner >> didRunBaseBenchmark [
	baseBenchmarkExecuted := true.
]

{ #category : #'as yet unclassified' }
SMarkTestWeakScalingRunner >> didSetUpBenchB [
	didSetUpBenchB := true.
]

{ #category : #'as yet unclassified' }
SMarkTestWeakScalingRunner >> didTearDownBenchC [
	didTearDownBenchC := true.
]

{ #category : #initialization }
SMarkTestWeakScalingRunner >> initialize [
	super initialize.

	setUpCount := 0.
	tearDownCount := 0.
	notifyRunnerWasExecuted := 0.
	
	baseBenchmarkExecuted := false.

	performedBenchmarks := OrderedCollection new.
]

{ #category : #'as yet unclassified' }
SMarkTestWeakScalingRunner >> isNotifyRunnerWasExecutedSet [
	^ notifyRunnerWasExecuted > 0
]

{ #category : #'as yet unclassified' }
SMarkTestWeakScalingRunner >> notifyRunnerWasExecuted [
	notifyRunnerWasExecuted := notifyRunnerWasExecuted + 1
]

{ #category : #'as yet unclassified' }
SMarkTestWeakScalingRunner >> performedBenchmarks [
	^ performedBenchmarks
]

{ #category : #'as yet unclassified' }
SMarkTestWeakScalingRunner >> setUp [
	notifyRunnerWasExecuted := false
]
