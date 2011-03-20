as yet unclassified
testPerformBenchmark
	"Ensure that performBenchmark executes all the defined #bench methods, but for instance not #Bench"
	
	| runner performedBenchmarks |
	runner := self runnerClass execute: SMarkTestRunnerSuiteForPerfromBenchmark new.
	performedBenchmarks := runner performedBenchmarks.

	self assert: (performedBenchmarks includes: #benchAfsdfsdfsdf).
	self assert: (performedBenchmarks includes: #benchBsdfasereSDSfsdfsdfs).
	self assert: (performedBenchmarks includes: #benchC).
	self assert: (performedBenchmarks includes: #benchZZ).

	self deny: (performedBenchmarks includes: #BenchShouldNotBeExecuted).