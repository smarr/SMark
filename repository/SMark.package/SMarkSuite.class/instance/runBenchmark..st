benchmarking
runBenchmark: aSelector
	
	[self setUp.
	 self performCustomSelector: aSelector with: #setUp.
	 runner performBenchmark: aSelector] ensure: [
		self performCustomSelector: aSelector with: #tearDown.
		self tearDown.
		self cleanUpInstanceVariables]