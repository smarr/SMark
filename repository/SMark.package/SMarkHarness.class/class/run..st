script entry
run: arguments
	"Execcuted from the command line using something similar to
	 ./vm my.image SMarkHarness SMarkRunner SMarkReporter SMarkLoops\>\>benchIntLoop 1 1 5
	 ./vm my.image SMarkHarness SMarkRunner SMarkReporter SMarkLoops.benchIntLoop 1 1 5"
	
	(self shouldShowUsage: arguments)
		ifTrue: [
			self usage.
			^ self.
		].
	
	
	
	
	