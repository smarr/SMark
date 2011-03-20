as yet unclassified
testAutosizingBaseBenchmark
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
	
