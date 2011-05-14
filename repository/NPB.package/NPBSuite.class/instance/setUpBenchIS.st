benchmarking
setUpBenchIS
	"Prepare IS benchmark"
	| sizeClass threadCnt |
	
	sizeClass := runner problemSize.
	sizeClass ifNil:	[ sizeClass := NPBIS defaultProblemSize. ].
	
	threadCnt := runner processes.
	
	bench := NPBIS newOfSizeClass: sizeClass with: threadCnt serial: (threadCnt == 0).
	bench runner: runner.