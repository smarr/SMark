Class {
	#name : #SMarkWeakScalingRunnerTest,
	#superclass : #SMarkRunnerTest,
	#category : 'SMark-Tests'
}

{ #category : #'as yet unclassified' }
SMarkWeakScalingRunnerTest class >> shouldInheritSelectors [
	^ true
]

{ #category : #helper }
SMarkWeakScalingRunnerTest >> runnerClass [
	^ SMarkTestWeakScalingRunner
]

{ #category : #tests }
SMarkWeakScalingRunnerTest >> testInnerIterations [
	"Test the semantics of the inner loop parameter"
	| runner results |
	
	"Setup"
	runner := self runnerClass new.
	runner iterations: 1.
	runner innerIterations: 1.  
	runner processes: 10.
	runner suite: SMarkTestRunnerSuite new.
	results := runner execute.
	
	self assert: 10 equals: runner countWasExecuted.
	self assert: 1  equals: (results at: #NotifyRunner) size.
	
	runner := self runnerClass new.
	runner iterations: 2.
	runner innerIterations: 1.  
	runner processes: 10.
	runner suite: SMarkTestRunnerSuite new.
	results := runner execute.
	
	self assert: 20 equals: runner countWasExecuted.
	self assert: 2  equals: (results at: #NotifyRunner) size.
	
	
	runner := self runnerClass new.
	runner iterations: 2.
	runner innerIterations: 4.  
	runner processes: 10.
	runner suite: SMarkTestRunnerSuite new.
	results := runner execute.
	
	self assert: (20 * 4) equals: runner countWasExecuted.
	self assert: 2  equals: (results at: #NotifyRunner) size.
	
	runner := self runnerClass new.
	runner iterations: 4.
	runner innerIterations: 7.  
	runner processes: 10.
	runner suite: SMarkTestRunnerSuite new.
	results := runner execute.
	
	self assert: (40 * 7) equals: runner countWasExecuted.
	self assert: 4           equals: (results at: #NotifyRunner) size.
]

{ #category : #tests }
SMarkWeakScalingRunnerTest >> testWeakScaling3Processes [
	"test with small number of processes and varying number of iterations"
	| runner results |
	
	"Setup for 2 iteration, and 3 process"
	runner := self runnerClass new.
	runner iterations: 2.
	runner processes: 3.
	runner suite: SMarkTestRunnerSuite new.
	results := runner execute.
	
	self assert: 6 equals: runner countWasExecuted.
	self assert: 2 equals: (results at: #NotifyRunner) size.
]

{ #category : #tests }
SMarkWeakScalingRunnerTest >> testWeakScalingFewProcesses [
	"test with small number of processes and varying number of iterations"
	| runner results |
	
	"Setup for 1 iteration, and 1 process"
	runner := self runnerClass new.
	runner iterations: 1.
	runner processes: 1.
	runner suite: SMarkTestRunnerSuite new.
	results := runner execute.
	
	self assert: 1 equals: runner countWasExecuted.
	
]

{ #category : #tests }
SMarkWeakScalingRunnerTest >> testWeakScalingManyProcesses [
	"test with large number of processes and varying number of iterations"
	| runner results |
	
	"Setup"
	runner := self runnerClass new.
	runner iterations: 1.
	runner processes: 10.
	runner suite: SMarkTestRunnerSuite new.
	results := runner execute.
	
	self assert: 10 equals: runner countWasExecuted.
	self assert: 1  equals: (results at: #NotifyRunner) size.
	
	runner := self runnerClass new.
	runner iterations: 2.
	runner processes: 10.
	runner suite: SMarkTestRunnerSuite new.
	results := runner execute.
	
	self assert: 20 equals: runner countWasExecuted.
	self assert: 2  equals: (results at: #NotifyRunner) size.
	
	runner := self runnerClass new.
	runner iterations: 4.
	runner processes: 10.
	runner suite: SMarkTestRunnerSuite new.
	results := runner execute.
	
	self assert: 40 equals: runner countWasExecuted.
	self assert: 4  equals: (results at: #NotifyRunner) size.
]
