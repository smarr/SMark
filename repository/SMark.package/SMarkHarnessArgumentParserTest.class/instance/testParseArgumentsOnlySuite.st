tests
testParseArgumentsOnlySuite
	| arguments runnerAndReporter runner reporter |
	arguments := {#ignored. 'SMarkTestSuite' }.
	runnerAndReporter := parser parse: arguments.
	
	runner   := runnerAndReporter first.
	reporter := runnerAndReporter second.
	
	self assert: runner notNil.
	self assert: reporter notNil.
	
	self assert: (runner suite isKindOf: SMarkTestSuite).
	self assert: runner suite selectedBenchmarks isNil.
