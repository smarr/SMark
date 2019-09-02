"
This class is used for unit testing only.
"
Class {
	#name : #SMarkTestSuite,
	#superclass : #SMarkSuite,
	#instVars : [
		'a',
		'b',
		'c',
		'd'
	],
	#category : 'SMark-Tests'
}

{ #category : #'as yet unclassified' }
SMarkTestSuite class >> defaultRunner [
	^ SMarkTestRunner
]

{ #category : #'as yet unclassified' }
SMarkTestSuite class >> isAbstractClass [
	"This is more like a hack, but we do not want to execute this as a benchmark"
	^ true
]

{ #category : #'as yet unclassified' }
SMarkTestSuite >> a [
	^a
]

{ #category : #'as yet unclassified' }
SMarkTestSuite >> b [
	^b
]

{ #category : #'as yet unclassified' }
SMarkTestSuite >> benchA [
	a := #executed.
	(Delay forMilliseconds: 1) wait.
]

{ #category : #'as yet unclassified' }
SMarkTestSuite >> benchB [
	b := #executed.
	(Delay forMilliseconds: 1) wait.
]

{ #category : #'as yet unclassified' }
SMarkTestSuite >> benchC [
	c := #executed.
]

{ #category : #'as yet unclassified' }
SMarkTestSuite >> benchWithMultipleCriteria [
	| t1 t2 t3 |
	t3 := runner createTimer: 't3'.
	t3 start.
	
	(Delay forMilliseconds: 25) wait.
	
	t2:= runner createTimer: 't2'.
	t2 start.
	(Delay forMilliseconds: 15) wait.	
	
	t1 := runner createTimer: 't1'.  
	t1 start.
	(Delay forMilliseconds: 10) wait.
	
	
	t3 stop.
	t2 stop.
	t1 stop.    
]

{ #category : #'as yet unclassified' }
SMarkTestSuite >> c [
	^c
]

{ #category : #'as yet unclassified' }
SMarkTestSuite >> d [
	^d
]

{ #category : #'initialize-release' }
SMarkTestSuite >> initialize [
	super initialize.
	
	"Filling in some test data"
	a := 1.
	b := 2.
	c := #three.
	d := '42'.
	
]

{ #category : #running }
SMarkTestSuite >> setUp [
	runner countSetUpInvoke
]

{ #category : #'as yet unclassified' }
SMarkTestSuite >> setUpBenchB [
	runner didSetUpBenchB
]

{ #category : #running }
SMarkTestSuite >> tearDown [
	runner countTearDownInvoke
]

{ #category : #'as yet unclassified' }
SMarkTestSuite >> tearDownBenchC [
	runner didTearDownBenchC
]
