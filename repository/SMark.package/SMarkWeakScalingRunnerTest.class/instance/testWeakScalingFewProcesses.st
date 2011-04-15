as yet unclassified
testWeakScalingFewProcesses
	"test with small number of processes and varying number of iterations"
	| runner results |
	
	"Setup for 1 iteration, and 1 process"
	runner := self runnerClass new.
	runner iterations: 1.
	runner processes: 1.
	runner suite: SMarkTestRunnerSuite new.
	results := runner execute.
	
	self assert: 1 equals: runner countWasExecuted.
	