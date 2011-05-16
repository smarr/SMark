argument parsing
determineBenchmarkParameters
	"Initialize with defaults, will be overwritten in case
	 it is specified."
	iterations := runner class defaultNumberOfIterations.
	processes  := runner class defaultNumberOfProcesses.
	problemSize:= suite class defaultProblemSize.
	
	self determineBenchmarkParametersFromArguments.
	
	runner iterations: iterations.
	runner processes: processes.
	runner problemSize: problemSize.