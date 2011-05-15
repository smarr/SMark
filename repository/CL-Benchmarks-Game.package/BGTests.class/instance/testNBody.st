as yet unclassified
testNBody
	self shouldnt: [
		BGNBody run: #(ignored '1' '1000') with: RoarBenchmarkHarness new]
		 raise: Error.