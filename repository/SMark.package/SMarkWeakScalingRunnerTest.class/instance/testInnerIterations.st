tests
testInnerIterations
	"Test the semantics of the inner loop parameter"
	| runner results |
	
	"Setup"
	runner := self runnerClass new.
	runner iterations: 1.
	runner innerIterations: 1.  
	runner processes: 10.
	runner suite: SMarkTestRunnerSuite new.
	results := runner execute.
	
	self assert: 10 equals: runner countWasExecuted.
	self assert: 1  equals: (results at: #NotifyRunner) size.
	
	runner := self runnerClass new.
	runner iterations: 2.
	runner innerIterations: 1.  
	runner processes: 10.
	runner suite: SMarkTestRunnerSuite new.
	results := runner execute.
	
	self assert: 20 equals: runner countWasExecuted.
	self assert: 2  equals: (results at: #NotifyRunner) size.
	
	
	runner := self runnerClass new.
	runner iterations: 2.
	runner innerIterations: 4.  
	runner processes: 10.
	runner suite: SMarkTestRunnerSuite new.
	results := runner execute.
	
	self assert: (20 * 4) equals: runner countWasExecuted.
	self assert: 2  equals: (results at: #NotifyRunner) size.
	
	runner := self runnerClass new.
	runner iterations: 4.
	runner innerIterations: 7.  
	runner processes: 10.
	runner suite: SMarkTestRunnerSuite new.
	results := runner execute.
	
	self assert: (40 * 7) equals: runner countWasExecuted.
	self assert: 4           equals: (results at: #NotifyRunner) size.