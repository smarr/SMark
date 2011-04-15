benchmarking
startBenchmarkAndWaitForCompletion: aSelector
	"measure the time the compiler needs to do something.
	 The benchmark is starting the given number of processes,
	 and then each process is running the benchmark the given number
	 of iterations"

	| runningProcesses monitor signal |
	
	numProcesses = 1 ifTrue: [
		"In the sequential case, we do not spawn other processes"
		Processor thisProcess useOnlyMainCore.
		Processor thisProcess priority: Processor highestPriority.
		1 to: numIterations do: [:i | suite perform: aSelector].
		^ self].
	
	" Now the parallel case"
	
	monitor := Semaphore forMutualExclusion.
	signal := Semaphore new.
	
	runningProcesses :=  numProcesses.
	
	monitor critical: [
		1 to: numProcesses do: [ :procNum |
			| proc |
			proc := [1 to: numIterations do: [:i | suite perform: aSelector]. 
			 		monitor critical: [
						runningProcesses := runningProcesses - 1.
						(runningProcesses == 0) ifTrue: [signal signal]]
				] newProcess.
			proc priority: Processor highestPriority.
			proc name: (self class name, '-',  procNum asString).
			proc resume.
			 "On: procNum"].
	].
	signal wait.