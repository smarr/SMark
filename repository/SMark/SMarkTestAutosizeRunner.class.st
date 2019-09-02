Class {
	#name : #SMarkTestAutosizeRunner,
	#superclass : #SMarkAutosizeRunner,
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
SMarkTestAutosizeRunner >> baseBenchmarkExecuted [
	^ baseBenchmarkExecuted
]

{ #category : #'as yet unclassified' }
SMarkTestAutosizeRunner >> countSetUpInvoke [
	setUpCount := setUpCount + 1
]

{ #category : #'as yet unclassified' }
SMarkTestAutosizeRunner >> countTearDownInvoke [
	tearDownCount := tearDownCount + 1
]

{ #category : #'as yet unclassified' }
SMarkTestAutosizeRunner >> countWasExecuted [
	^ notifyRunnerWasExecuted 
]

{ #category : #'as yet unclassified' }
SMarkTestAutosizeRunner >> didPerform: aSymbol [
	performedBenchmarks add: aSymbol.
]

{ #category : #'as yet unclassified' }
SMarkTestAutosizeRunner >> didRunBaseBenchmark [
	baseBenchmarkExecuted := true.
]

{ #category : #'as yet unclassified' }
SMarkTestAutosizeRunner >> didSetUpBenchB [
	didSetUpBenchB := true.
]

{ #category : #'as yet unclassified' }
SMarkTestAutosizeRunner >> didTearDownBenchC [
	didTearDownBenchC := true.
]

{ #category : #initialization }
SMarkTestAutosizeRunner >> initialize [
	super initialize.

	setUpCount := 0.
	tearDownCount := 0.
	notifyRunnerWasExecuted := 0.
	
	baseBenchmarkExecuted := false.

	performedBenchmarks := Set new.
	
	"set the targetTime to something which is more reasonable for testing"
	targetTime := 50.
]

{ #category : #'as yet unclassified' }
SMarkTestAutosizeRunner >> isNotifyRunnerWasExecutedSet [
	^ notifyRunnerWasExecuted
]

{ #category : #'as yet unclassified' }
SMarkTestAutosizeRunner >> notifyRunnerWasExecuted [
	notifyRunnerWasExecuted := notifyRunnerWasExecuted + 1
]

{ #category : #'as yet unclassified' }
SMarkTestAutosizeRunner >> performedBenchmarks [
	^ performedBenchmarks
]

{ #category : #'as yet unclassified' }
SMarkTestAutosizeRunner >> setUp [
	notifyRunnerWasExecuted := false
]
