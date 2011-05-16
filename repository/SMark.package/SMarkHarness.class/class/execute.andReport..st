benchmarking
execute: runner andReport: reporter
	runner execute.
	reporter runner: runner.
	reporter outputStream: self defaultOutputDestination.
	reporter report.