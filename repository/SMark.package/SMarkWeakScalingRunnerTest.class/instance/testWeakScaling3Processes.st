as yet unclassified
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
	
	results error: 'Should test for a bit more, for instance correct result layout, should be just one result per iteration, indepent of processes'.