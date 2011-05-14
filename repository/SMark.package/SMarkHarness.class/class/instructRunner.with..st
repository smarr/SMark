helper
instructRunner: runner with: parsedBenchmarkOrSuite
	| suite |
	(parsedBenchmarkOrSuite isKindOf: Array)
		ifTrue:  [
			suite := parsedBenchmarkOrSuite first new.
			suite runOnly: parsedBenchmarkOrSuite second.
		]
		ifFalse: [
			suite := parsedBenchmarkOrSuite new.
		].
	
	runner suite: suite.
	
	^ suite
	 