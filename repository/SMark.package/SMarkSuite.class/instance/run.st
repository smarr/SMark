running
run
	"Executes all the benchmarks in the suite, 
	 coordinating with the runner when necessary"
	self class allSelectors
		do: [ :selector |
			(self shouldRunSelector: selector)
				ifTrue: [ 
					self runBenchmark: selector ]
		].
	