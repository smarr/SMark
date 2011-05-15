as yet unclassified
testFannkuchRedux
	self shouldnt: [
		BGFannkuchRedux run: #(ignored '1' '7') with: RoarBenchmarkHarness new]
		 raise: Error.