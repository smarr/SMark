as yet unclassified
testBinaryTrees
	self shouldnt: [
		BGBinaryTrees run: #(ignored 1 '9') with: RoarBenchmarkHarness new]
		 raise: Error.