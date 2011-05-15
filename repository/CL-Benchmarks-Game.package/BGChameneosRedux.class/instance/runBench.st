as yet unclassified
runBench
	| result report |

	report := TextStream with: String new.
	result := BGMall runBenchMark: problemSize asInteger on: report.
	
	" Result should be 2*problemSize"
	result = (2 * problemSize asInteger) ifFalse: [
		RVMOperations print: self class name, ' benchmark failed. Input: ', numberOfProcesses asString, ' Output: ', result asString  ].
