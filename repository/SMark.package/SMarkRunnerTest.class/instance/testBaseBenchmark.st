tests
testBaseBenchmark
	"Ensure the base benchmark is executed when available"
	
	| runner |
	runner := self runnerClass execute: SMarkTestSuiteWithBaseBenchmark new.

	self assert: runner baseBenchmarkExecuted  