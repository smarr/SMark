benchmarking
innerBenchmarkLoop
	DBStrength initialize.
	DBPlanner chainTest: innerIterations.
	DBPlanner projectionTest: innerIterations.
	^ true