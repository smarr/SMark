as yet unclassified
testIterations
	| runner |
	" simple scenario should default to 1 run for now "
	runner := self runnerClass execute: SMarkTestRunnerSuite new.
	
	self assert: runner countWasExecuted equals: 1.
	
	" but we can also be more fancy and set the number of iterations "
	runner := self runnerClass new.
	runner suite: SMarkTestRunnerSuite new.
	
	"first check again that the default is as expected"
	self assert: runner iterations equals: 1.  
	
	runner iterations: 10.
	self assert: 10 equals: runner iterations.
	
	runner execute.
	
	self assert: 10 equals: runner countWasExecuted.