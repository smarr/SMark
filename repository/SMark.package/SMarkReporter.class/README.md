SMarkReporter is a simple formatter of benchmark results. 


Example:

	| f |
	f := TextStream on: String new.
	PBenchmarkSimpleStatisticsReporter reportFor: (PTestBenchmarkRunnerSuiteForAutosizing run: 10) on: f.
	f contents