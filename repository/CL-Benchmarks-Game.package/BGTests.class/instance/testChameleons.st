as yet unclassified
testChameleons
	self shouldnt: [
		BGChameleons run: #(ignored '2' '200') with: RoarBenchmarkHarness new]
		 raise: Error.