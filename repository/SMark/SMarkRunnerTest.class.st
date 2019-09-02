Class {
	#name : #SMarkRunnerTest,
	#superclass : #TestCase,
	#category : 'SMark-Tests'
}

{ #category : #helper }
SMarkRunnerTest >> runnerClass [
	^ SMarkTestRunner
]

{ #category : #tests }
SMarkRunnerTest >> testBaseBenchmark [
	"Ensure the base benchmark is executed when available"
	
	| runner |
	runner := self runnerClass execute: SMarkTestSuiteWithBaseBenchmark new.

	self assert: runner baseBenchmarkExecuted  
]

{ #category : #tests }
SMarkRunnerTest >> testBaseBenchmarkNone [
	"Ensure that not having a base benchmark does not pose a problem"

	| runner |
	runner := self runnerClass execute: SMarkTestSuite new.

	self deny: runner baseBenchmarkExecuted  
]

{ #category : #tests }
SMarkRunnerTest >> testBenchmarkWithMultipleCriteraTimers [
	"Check whether the benchmark benchWithMultipleCriteria, really results in different unrelated timings"
	| runner result |
	runner := self runnerClass execute: SMarkTestSuite new.
	
	result := (runner results at: #WithMultipleCriteria) at: 1.
	self assert: (result isKindOf: SMarkResult).
	
	self assert: result benchmarkName equals: #WithMultipleCriteria.
	self assert: (result total >= 50).
	
	self assert: (result criteria notNil).
	self assert: (result criteria respondsTo: #at:).
	
	self assert: ((result criteria at: 't1') totalTime >= 10).
	self assert: ((result criteria at: 't2') totalTime >= 25).
	self assert: ((result criteria at: 't3') totalTime >= 50).
	
]

{ #category : #tests }
SMarkRunnerTest >> testClassExecute [
	| runner |
	runner := self runnerClass execute: SMarkTestSuiteWithBaseBenchmark new.
	
	self assert: (runner isKindOf: self runnerClass).
]

{ #category : #tests }
SMarkRunnerTest >> testExecute [
	"Ensure all benchmarks are run, including the baseBenchmark and the results are returned"
	| runner results performedBenchmarks |
	runner := self runnerClass new.
	runner suite: SMarkTestRunnerSuiteForPerfromBenchmark new.
	results := runner execute.
	
	performedBenchmarks := runner performedBenchmarks.
		
	self assert: 5 equals: performedBenchmarks size.
	self assert: (performedBenchmarks includes: #baseBenchmark).
	
	self assert: (results respondsTo: #at:).
	self assert: (((results at: #baseBenchmark) at: 1) isKindOf: SMarkResult).
]

{ #category : #tests }
SMarkRunnerTest >> testIterations [
	| runner |
	" simple scenario should default to 1 run for now "
	runner := self runnerClass execute: SMarkTestRunnerSuite new.
	
	self assert: runner countWasExecuted equals: 1.
	
	" but we can also be more fancy and set the number of iterations "
	runner := self runnerClass new.
	runner suite: SMarkTestRunnerSuite new.
	
	"first check again that the default is as expected"
	self assert: runner iterations equals: 1.  
	
	runner iterations: 10.
	self assert: 10 equals: runner iterations.
	
	runner execute.
	
	self assert: 10 equals: runner countWasExecuted.
]

{ #category : #tests }
SMarkRunnerTest >> testPerformBenchmark [
	"Ensure that performBenchmark executes all the defined #bench methods, but for instance not #Bench"
	
	| runner performedBenchmarks |
	runner := self runnerClass execute: SMarkTestRunnerSuiteForPerfromBenchmark new.
	performedBenchmarks := runner performedBenchmarks.

	self assert: (performedBenchmarks includes: #benchAfsdfsdfsdf).
	self assert: (performedBenchmarks includes: #benchBsdfasereSDSfsdfsdfs).
	self assert: (performedBenchmarks includes: #benchC).
	self assert: (performedBenchmarks includes: #benchZZ).

	self deny: (performedBenchmarks includes: #BenchShouldNotBeExecuted).
]

{ #category : #tests }
SMarkRunnerTest >> testResultStructure [
	| runner results resultA resultB suite |
	suite := SMarkTestSuite new.
	runner := self runnerClass execute: suite.
	results := runner results.
	
	"Don't care whether it is a dictionary, but at least it should present us something that maps benchmark names to result objects"
	self assert: (results respondsTo: #at:).

	resultA := (results at: #A) at: 1.
	resultB := (results at: #B) at: 1.


	self assert: (resultA isKindOf: SMarkResult).
	self assert: (resultB isKindOf: SMarkResult).
	self assert: (((results at: #C) at: 1) isKindOf: SMarkResult).
	
	"Make sure some properties of the result objects is ensured"
	self assert: resultA total > 0.
	self assert: #A equals: resultA benchmarkName.
	self assert: suite equals: resultA suite.
	self assert: 1 equals: resultA criteria size.
	
	self assert: resultB total > 0.
	self assert: #B equals: resultB benchmarkName.
	self assert: suite equals: resultB suite.
	self assert: 1 equals: resultB criteria size.
	"Testing for multi-criteria results somewhere else"
]

{ #category : #tests }
SMarkRunnerTest >> testTimer [
	"Simple test whether a timer is created and it is from the expected class.
	 This test is very basic, other tests like testBenchmarkWithMultipleCirteria* need to cover the rest"
	| runner timer |
	runner := self runnerClass new.
	timer := runner createTimer: #foo.

	self assert: timer name equals: #foo.
	self assert: (timer isKindOf: self runnerClass defaultTimer).  
]
