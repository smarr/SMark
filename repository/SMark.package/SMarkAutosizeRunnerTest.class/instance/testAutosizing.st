tests
testAutosizing
	"Ensure that the runtime is automatically sized up to a predefined value"
	| runner results big small runTime benchmarkSum |
	
	runner := self runnerClass new.
	
	"sanity check for target time"
	"Not checked since we reduced the targetTime for testing:
	 self assert: self runnerClass defaultTargetTime equals: runner targetTime."
	self assert: (self runnerClass defaultTargetTime > 250).
	
	runner iterations: 3.
	  
	runner suite: SMarkTestRunnerSuiteForAutosizing new.
	
	"Execute the benchmarks and take the overall time it takes"
	runTime := Time millisecondClockValue.
	results := runner execute.
	runTime := Time millisecondClockValue - runTime.
	
	"There should be three benchmarks"
	self assert: 3 equals: results size.
	self assert: (results includesKey: #baseBenchmark).
	big := results at: #Big.
	small := results at: #Small.
	
	self assert: (big respondsTo: #at:).
	self assert: 3 equals: big size.
	
	self assert: (runner targetTime <= (big at: 1) total).
	self assert: (runner targetTime <= (small at: 1) total).
	
	"Calculate the sum of all measurements"
	benchmarkSum := big inject: 0 into: [:sum :result| sum + result total].
	benchmarkSum := small inject: benchmarkSum into: [:sum :result| sum + result total].
	
	"And now make sure that we not try to find the problem size for every but only the first run"
	self assert: (benchmarkSum * 2) > runTime.
	
