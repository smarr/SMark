as yet unclassified
testIterations
	| runner |
	"This test is different then the one in the base class, it is not direct, but just looks at the results"
	
	" simple scenario should default to 1 run for now "
	runner := self runnerClass execute: SMarkTestRunnerSuite new.
	
	self assert: 1 equals: (runner results at: #NotifyRunner) size.
	
	" but we can also be more fancy and set the number of iterations "
	runner := self runnerClass new.
	runner suite: SMarkTestRunnerSuite new.
	
	"first check again that the default is as expected"
	self assert: 1 equals: runner iterations.  
	
	runner iterations: 10.
	self assert: runner iterations equals: 10.
	
	runner execute.
	
	self assert: 10 equals: (runner results at: #NotifyRunner) size.