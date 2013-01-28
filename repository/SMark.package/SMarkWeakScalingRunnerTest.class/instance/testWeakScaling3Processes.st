tests
testWeakScaling3Processes
	"test with small number of processes and varying number of iterations"
	| runner results |
	
	"Setup for 2 iteration, and 3 process"
	runner := self runnerClass new.
	runner iterations: 2.
	runner processes: 3.
	runner suite: SMarkTestRunnerSuite new.
	results := runner execute.
	
	self assert: 6 equals: runner countWasExecuted.
	self assert: 2 equals: (results at: #NotifyRunner) size.