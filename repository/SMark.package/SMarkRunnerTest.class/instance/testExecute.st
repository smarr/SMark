tests
testExecute
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