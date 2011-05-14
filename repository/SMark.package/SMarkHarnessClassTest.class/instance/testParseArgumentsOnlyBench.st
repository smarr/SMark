tests
testParseArgumentsOnlyBench
	| arguments runnerAndReporter runner reporter runOnly |
	arguments := {#ignored. 'SMarkTestSuite.benchA' }.
	runnerAndReporter := SMarkHarness parseArguments: arguments.
	
	runner   := runnerAndReporter first.
	reporter := runnerAndReporter second.
	
	self assert: runner notNil.
	self assert: reporter notNil.
	
	self assert: (runner suite isKindOf: SMarkTestSuite).
	runOnly := runner suite selectedBenchmarks.
	self assert: 1 equals: runOnly size.
	self assert: (runOnly includes: #benchA).
