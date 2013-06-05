benchmarking-scripts
chameneosredux2
	"ChameneosRedux chameneosredux2" 
	| report |
	report := TextStream with: ByteString new.
	self new runBenchMark: 600 on: report.
	^report contents