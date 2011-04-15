as yet unclassified
initialize
	super initialize.

	setUpCount := 0.
	tearDownCount := 0.
	notifyRunnerWasExecuted := 0.
	
	baseBenchmarkExecuted := false.

	performedBenchmarks := OrderedCollection new.