argument parsing
determineSuiteOrBenchmark
	self parseBenchmarkOrSuite: current.
	self instructRunner.