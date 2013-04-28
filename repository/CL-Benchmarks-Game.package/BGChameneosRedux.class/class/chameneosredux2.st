benchmarking-scripts
chameneosredux2
	"ChameneosRedux chameneosredux2" 
	| report |
	report := TextStream with: String new.
	self new runBenchMark: 600 on: report.
	^report contents