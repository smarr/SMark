as yet unclassified
testExecute
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