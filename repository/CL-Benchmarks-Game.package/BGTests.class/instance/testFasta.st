as yet unclassified
testFasta
	self shouldnt: [
		BGFasta run: #(ignored '1' '1000') with: RoarBenchmarkHarness new]
		 raise: Error.