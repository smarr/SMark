as yet unclassified
testBaseBenchmark
	"Different from base test: Ensure the base benchmark is NOT executed when available"
	
	| runner |
	runner := self runnerClass execute: SMarkTestSuiteWithBaseBenchmark new.

	self deny: runner baseBenchmarkExecuted  