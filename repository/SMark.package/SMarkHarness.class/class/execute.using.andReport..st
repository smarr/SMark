as yet unclassified
execute: aBenchmarkOrSuite using: aRunnerClass andReport: withAReporterClass
	| parsedBenchmarkOrSuite suite runner reporter |
	
	parsedBenchmarkOrSuite := self parseBenchmarkOrSuite: aBenchmarkOrSuite.
	
	runner := aRunnerClass new.
	reporter := withAReporterClass new.
	self instructRunner: runner with: parsedBenchmarkOrSuite.