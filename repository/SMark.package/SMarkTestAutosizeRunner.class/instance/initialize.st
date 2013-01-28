initialization
initialize
	super initialize.

	setUpCount := 0.
	tearDownCount := 0.
	notifyRunnerWasExecuted := 0.
	
	baseBenchmarkExecuted := false.

	performedBenchmarks := Set new.
	
	"set the targetTime to something which is more reasonable for testing"
	targetTime := 50.