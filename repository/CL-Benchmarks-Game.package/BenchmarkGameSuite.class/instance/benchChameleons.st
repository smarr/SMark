benchmarking
benchChameleons
	| result problemSize |
	problemSize := self problemSize ifNotNilDo: [:ps | ps asInteger ]
										  ifNil: [ BGChameleons defaultProblemSize ].
	result := BGChameleons chameneos: problemSize.
	
	"Result should be 2*numberOfProcesses (as far as I understand the benchmark)"
	self flag: 'TODO adapt once verification is supported'.
	result = (2 * problemSize)
	ifFalse: [
		ScriptConsole print: BGChameleons name, ' benchmark failed. Input: ', 
								 problemSize asString, ' Output: ', result asString
	].