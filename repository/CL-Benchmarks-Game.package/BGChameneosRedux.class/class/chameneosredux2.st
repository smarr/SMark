benchmarking-scripts
chameneosredux2
	"ChameneosRedux chameneosredux2" 
	| report |
	report := TextStream with: String new.
	BGMall runBenchMark: 600 on: report.
	^report contents