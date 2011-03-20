as yet unclassified
testBaseBenchmarkNone
	"Ensure that not having a base benchmark does not pose a problem"

	| runner |
	runner := self runnerClass execute: SMarkTestSuite new.

	self deny: runner baseBenchmarkExecuted  