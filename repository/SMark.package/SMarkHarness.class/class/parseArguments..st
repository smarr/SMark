helper
parseArguments: arguments
	| runner reporter suiteOrBenchmark suite
	  iterations processes problemSize
	  i current numParams currentObj |

	numParams := arguments size.
	i := 2.
	
	current := arguments at: i.
	currentObj := (Smalltalk classNamed: current) ifNotNilDo: [:cls | cls new].
	
	(currentObj isKindOf: SMarkRunner)
		ifFalse: [ runner := self defaultRunner new. ]
		ifTrue:  [ runner := currentObj.
			i := i + 1.
			i <= numParams ifTrue: [
				current := arguments at: i.
				currentObj := (Smalltalk classNamed: current) ifNotNilDo: [:cls | cls new].
			]
		].
	
	(currentObj isKindOf: SMarkReporter)
		ifFalse: [ reporter := self defaultReporter new. ]
		ifTrue:  [ reporter := currentObj.
			i := i + 1.
			i <= numParams ifTrue: [
				current := arguments at: i.
			]
		].
		
	suiteOrBenchmark := self parseBenchmarkOrSuite: current.
	suite := self instructRunner: runner with: suiteOrBenchmark.   
	
	"Initialize with defaults, will be overwritten in case
	 it is specified."
	iterations := runner class defaultNumberOfIterations.
	processes  := runner class defaultNumberOfProcesses.
	problemSize:= suite class defaultProblemSize.
	
	i := i + 1.
	i <= numParams ifTrue: [
		iterations := (arguments at: i) asInteger.
		i := i + 1.
		i <= numParams ifTrue: [
			processes := (arguments at: i) asInteger.
			i := i + 1.
			i <= numParams ifTrue: [
				problemSize := arguments at: i.
			]
		]
	].

	runner iterations: iterations.
	runner processes: processes.
	runner problemSize: problemSize.
	
	^ {runner. reporter}