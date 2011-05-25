benchmarking
execute: aSelector withProcesses: numberOfProcesses withTimer: timer
	"This case is meant for all cases. REM: this is also used for numProc==1 to be able to measure the process start overhead in all cases.
	 It will start the processes and wait for their completion."
	
	| processes monitor runningProcesses signal |
	processes			:= Array new: numberOfProcesses.
	monitor			:= Semaphore forMutualExclusion.
	signal				:= Semaphore new.
	runningProcesses := numberOfProcesses.
	
	"First initialize the processes"
	1 to: numberOfProcesses do: [ :procNum |
		| proc |
		proc := [1 to: numInnerIterations do: [:i | suite perform: aSelector]. 
			 		monitor critical: [
						runningProcesses := runningProcesses - 1.
						(runningProcesses == 0) ifTrue: [signal signal]]
					] newProcess.
		proc priority: Processor highestPriority.
		proc name: (self class name, '-',  procNum asString).
		processes at: procNum put: proc.
		"On: procNum"
		].
	
	"Now, execute the benchmark and do the timing now"
	timer start.
	1 to: numberOfProcesses do: [ :procNum |
		(processes at: procNum) resume.
	].
	signal wait.
	timer stop.