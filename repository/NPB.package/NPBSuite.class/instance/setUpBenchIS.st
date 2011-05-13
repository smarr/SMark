benchmarking
setUpBenchIS
	"Prepare IS benchmark"
	| sizeClass threadCnt |
	
	sizeClass := runner problemSize asSymbol.
	threadCnt := runner processes.
	
	bench := NPBIS newOfSizeClass: sizeClass with: threadCnt serial: (threadCnt == 0).
	bench runner: runner.