benchmarking
benchChameneosRedux
	| result report problemSize |
	problemSize := self problemSize ifNotNil: [ self problemSize asInteger ]
								  ifNil: [ BGChameneosRedux defaultProblemSize ].
	report := TextStream with: String new.
	result := BGMall runBenchMark: problemSize on: report.
	
	"Result should be 2*problemSize"
	self flag: 'TODO: adapt once verification is supported'.
	result = (2 * problemSize) ifFalse: [
		Error signal: self class name, ' benchmark failed. Input: ',
								 runner processes asString, ' Output: ', result asString  ].