as yet unclassified
runBench
	| result |
	result := self class chameneos: self problemSize.
	
	" Result should be 2*numberOfProcesses (as far as I understand the benchmark)"
	result = (2 * self problemSize) ifFalse: [
		RVMOperations print: self class name, ' benchmark failed. Input: ', self problemSize asString, ' Output: ', result asString  ].
