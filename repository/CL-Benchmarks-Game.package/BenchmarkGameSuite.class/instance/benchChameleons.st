benchmarking
benchChameleons
	| result |
	result := BGChameleons chameneos: self problemSize.
	
	"Result should be 2*numberOfProcesses (as far as I understand the benchmark)"
	self flag: 'TODO adapt once verification is supported'.
	result = (2 * self problemSize)
	ifFalse: [
		RVMOperations print: BGChameleons name, ' benchmark failed. Input: ', 
								 self problemSize asString, ' Output: ', result asString
	].