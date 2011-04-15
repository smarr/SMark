as yet unclassified
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
	
	results error: 'Should test for a bit more, for instance correct result layout, should be just one result per iteration, indepent of processes'.
	
	runner := self runnerClass new.
	runner iterations: 4.
	runner processes: 10.
	runner suite: SMarkTestRunnerSuite new.
	results := runner execute.
	
	self assert: 40 equals: runner countWasExecuted.