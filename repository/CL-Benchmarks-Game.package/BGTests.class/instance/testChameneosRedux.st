tests
testChameneosRedux
	| report result |
	
	report := TextStream with: String new.
	result := BGChameneosRedux new runBenchMark: 600 on: report.
	self assert: result equals: 1200.
	
	report := TextStream with: String new.
	result := BGChameneosRedux new runBenchMark: 555 on: report.
	self assert: result equals: (555 * 2).
	
	report := TextStream with: String new.
	result := BGChameneosRedux new runBenchMark: 121 on: report.
	self assert: result equals: (121 * 2).
	