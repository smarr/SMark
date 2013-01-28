tests
testWeakScalingManyProcesses
	"test with large number of processes and varying number of iterations"
	| runner results |
	
	"Setup"
	runner := self runnerClass new.
	runner iterations: 1.
	runner processes: 10.
	runner suite: SMarkTestRunnerSuite new.
	results := runner execute.
	
	self assert: 10 equals: runner countWasExecuted.
	self assert: 1  equals: (results at: #NotifyRunner) size.
	
	runner := self runnerClass new.
	runner iterations: 2.
	runner processes: 10.
	runner suite: SMarkTestRunnerSuite new.
	results := runner execute.
	
	self assert: 20 equals: runner countWasExecuted.
	self assert: 2  equals: (results at: #NotifyRunner) size.
	
	runner := self runnerClass new.
	runner iterations: 4.
	runner processes: 10.
	runner suite: SMarkTestRunnerSuite new.
	results := runner execute.
	
	self assert: 40 equals: runner countWasExecuted.
	self assert: 4  equals: (results at: #NotifyRunner) size.