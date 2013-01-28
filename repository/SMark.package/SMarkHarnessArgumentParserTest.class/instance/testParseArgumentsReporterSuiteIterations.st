tests
testParseArgumentsReporterSuiteIterations
	| arguments runnerAndReporter runner reporter |
	arguments := {#ignored. 'SMarkSimpleStatisticsReporter'. 'SMarkTestSuite'. '13'. }.
	runnerAndReporter := parser parse: arguments.
	
	runner   := runnerAndReporter first.
	reporter := runnerAndReporter second.
	
	self assert: runner notNil.
	self assert: reporter notNil.
	
	self assert: (reporter isKindOf: SMarkSimpleStatisticsReporter).
	self assert: (runner suite isKindOf: SMarkTestSuite).
	self assert: runner suite selectedBenchmarks isNil.
	
	self assert: 13 equals: runner iterations.	