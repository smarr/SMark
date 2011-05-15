as yet unclassified
testChameneosRedux
	| report result |
	
	report := TextStream with: String new.
	result := BGMall runBenchMark: 600 on: report.
	self assert: result equals: 1200.
	
	report := TextStream with: String new.
	result := BGMall runBenchMark: 555 on: report.
	self assert: result equals: (555 * 2).
	
	report := TextStream with: String new.
	result := BGMall runBenchMark: 121 on: report.
	self assert: result equals: (121 * 2).
	