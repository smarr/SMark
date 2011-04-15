benchmarking
executeDirectly: aSelector withTimer: aTimer
	"In the sequential case, we do not spawn other processes"
	
	(Processor respondsTo: #thisProcess) ifTrue: [
		Processor thisProcess useOnlyMainCore.
		Processor thisProcess priority: Processor highestPriority.].
	
	aTimer start.
	suite perform: aSelector.
	aTimer stop.