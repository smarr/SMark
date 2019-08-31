benchmarking
benchCompiler
	"was Benchmark>>testCompiler"
	SMarkCompilerTarget new
		compile:
			'somethingDummy: aBlock repeated: nTimes | i emptyBlock emptyTime blockTime |
			nTimes > 1000 ifTrue: [^self time: aBlock repeatedK: nTimes // 1000].
			emptyBlock := [].
			emptyTime := Time millisecondsToRun:
							[i := 0.
							 [(i := i + 1) <= nTimes] whileTrue: [emptyBlock value]].
			blockTime := Time millisecondsToRun:
							[i := 0.
							 [(i := i + 1) <= nTimes] whileTrue: [aBlock value]].
			^blockTime - emptyTime';
		tearDown