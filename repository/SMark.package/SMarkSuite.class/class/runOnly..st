benchmarking
runOnly: aSelector
	"Execute only the bench name aSelector from the suite."
	
	^ self defaultRunner execute: (self new runOnly: aSelector)