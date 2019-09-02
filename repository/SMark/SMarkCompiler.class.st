Class {
	#name : #SMarkCompiler,
	#superclass : #SMarkSuite,
	#category : 'SMark-Classic'
}

{ #category : #'script entry' }
SMarkCompiler class >> defaultNumberOfIterations [
	^ 50
]

{ #category : #'script entry' }
SMarkCompiler class >> defaultNumberOfProcesses [
	^ 8
]

{ #category : #benchmarking }
SMarkCompiler >> benchCompiler [
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
]
