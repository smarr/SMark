benchmarking
timedBenchmarkExecution: aSelector
	"Will do a timed execution of the benchmark and return the result timer"
	| timer |
	timers := Dictionary new.

	timer := self createTimer: 'total'.
	
	numProcesses = 1 
		ifTrue:  [ self executeDirectly: aSelector withTimer: timer. ]
		ifFalse: [ self execute: aSelector withProcesses: numProcesses withTimer: timer. ].
	
	self recordResults: timer for: aSelector.
	
	^ timer