as yet unclassified
testChameneosRedux
	self shouldnt: [
		BGChameneosRedux run: #(ignored '1' '120') with: RoarBenchmarkHarness new]
		 raise: Error.