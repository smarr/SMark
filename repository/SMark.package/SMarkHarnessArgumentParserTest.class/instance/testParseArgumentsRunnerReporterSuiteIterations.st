as yet unclassified
testParseArgumentsRunnerReporterSuiteIterations
	| arguments runnerAndReporter runner reporter |
	arguments := {#ignored. 'SMarkTestRunner'. 'SMarkSimpleStatisticsReporter'. 'SMarkTestSuite'. '13'. }.
	runnerAndReporter := parser parse: arguments.
	
	runner   := runnerAndReporter first.
	reporter := runnerAndReporter second.
	
	self assert: runner notNil.
	self assert: reporter notNil.
	
	self assert: (runner isKindOf: SMarkTestRunner).
	self assert: (reporter isKindOf: SMarkSimpleStatisticsReporter).
	self assert: (runner suite isKindOf: SMarkTestSuite).
	self assert: runner suite selectedBenchmarks isNil.
	
	self assert: 13 equals: runner iterations.