as yet unclassified
testIS
	| verified |
	self shouldnt: [
		verified := NPBIS run: #(ignored 'S' '4') with: RoarBenchmarkHarness new]
		 raise: Error.
	self assert: verified.