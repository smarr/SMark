Class {
	#name : #SMarkAutosizeRunnerTest,
	#superclass : #SMarkRunnerTest,
	#category : 'SMark-Tests'
}

{ #category : #'as yet unclassified' }
SMarkAutosizeRunnerTest class >> shouldInheritSelectors [
	^ true
]

{ #category : #helper }
SMarkAutosizeRunnerTest >> runnerClass [
	^ SMarkTestAutosizeRunner
]

{ #category : #tests }
SMarkAutosizeRunnerTest >> testAutosizing [
	"Ensure that the runtime is automatically sized up to a predefined value"
	| runner results big small runTime benchmarkSum |
	
	runner := self runnerClass new.
	
	"sanity check for target time"
	"Not checked since we reduced the targetTime for testing:
	 self assert: self runnerClass defaultTargetTime equals: runner targetTime."
	self assert: (self runnerClass defaultTargetTime > 250).
	
	runner iterations: 3.
	  
	runner suite: SMarkTestRunnerSuiteForAutosizing new.
	
	"Execute the benchmarks and take the overall time it takes"
	runTime := Time millisecondClockValue.
	results := runner execute.
	runTime := Time millisecondClockValue - runTime.
	
	"There should be three benchmarks"
	self assert: 3 equals: results size.
	self assert: (results includesKey: #baseBenchmark).
	big := results at: #Big.
	small := results at: #Small.
	
	self assert: (big respondsTo: #at:).
	self assert: 3 equals: big size.
	
	self assert: (runner targetTime <= (big at: 1) total).
	self assert: (runner targetTime <= (small at: 1) total).
	
	"Calculate the sum of all measurements"
	benchmarkSum := big inject: 0 into: [:sum :result| sum + result total].
	benchmarkSum := small inject: benchmarkSum into: [:sum :result| sum + result total].
	
	"And now make sure that we not try to find the problem size for every but only the first run"
	self assert: (benchmarkSum * 2) > runTime.
	

]

{ #category : #tests }
SMarkAutosizeRunnerTest >> testAutosizingBaseBenchmark [
	"Ensure that baseBenchmarks are not delivering any data since I do not see how that could be done nicely"
	| runner results |
	runner := self runnerClass new.
	runner iterations: 3.
	runner suite: SMarkTestRunnerSuiteForAutosizing new.
	
	"Execute the benchmarks and take the overall time it takes"
	results := runner execute.
	
	"There should be two benchmarks"
	self assert: 3 equals: results size.
	self assert: 0 equals: ((results at: #baseBenchmark) at: 1) total.
	

]

{ #category : #tests }
SMarkAutosizeRunnerTest >> testBaseBenchmark [
	"Different from base test: Ensure the base benchmark is NOT executed when available"
	
	| runner |
	runner := self runnerClass execute: SMarkTestSuiteWithBaseBenchmark new.

	self deny: runner baseBenchmarkExecuted  
]

{ #category : #tests }
SMarkAutosizeRunnerTest >> testExecute [
	"This test is slightly different from the one in the base class"
	| runner results performedBenchmarks |
	runner := self runnerClass new.
	runner suite: SMarkTestRunnerSuiteForPerfromBenchmark new.
	results := runner execute.
	
	performedBenchmarks := runner performedBenchmarks.
		
	self assert: 4 equals: performedBenchmarks size.				"Different from base test"
	self deny: (performedBenchmarks includes: #baseBenchmark).	"Different from base test"
	
	self assert: (results respondsTo: #at:).
	
	"But still we get a result" "Different from base test"
	self assert: (((results at: #baseBenchmark) at: 1) isKindOf: SMarkResult).
]

{ #category : #tests }
SMarkAutosizeRunnerTest >> testIterations [
	| runner |
	"This test is different then the one in the base class, it is not direct, but just looks at the results"
	
	" simple scenario should default to 1 run for now "
	runner := self runnerClass execute: SMarkTestRunnerSuite new.
	
	self assert: 1 equals: (runner results at: #NotifyRunner) size.
	
	" but we can also be more fancy and set the number of iterations "
	runner := self runnerClass new.
	runner suite: SMarkTestRunnerSuite new.
	
	"first check again that the default is as expected"
	self assert: 1 equals: runner iterations.  
	
	runner iterations: 10.
	self assert: runner iterations equals: 10.
	
	runner execute.
	
	self assert: 10 equals: (runner results at: #NotifyRunner) size.
]
