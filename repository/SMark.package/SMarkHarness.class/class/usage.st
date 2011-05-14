helper
usage
	| usage |
	"Example usage: SMarkHarness SMarkRunner SMarkReporter SMarkLoops.benchIntLoop 1 1 5"
	usage := 'SMark Benchmark Framework, version: ', self version, String cr.
	usage := usage, String cr.
	usage := usage, 'Usage: <vm+image> SMarkHarness [runner] [reporter] <suiteOrBenchmark>', String cr.
	usage := usage, '                               [iterations [processes [problemSize]]]', String cr.
	usage := usage, String cr.
	
	usage := usage, 'Arguments:', String cr.
	usage := usage, ' runner             optional, a SMarkRunner class that executes the benchmarks', String cr.
	usage := usage, ' reporter           optional, a SMarkReporter class that processes', String cr.
	usage := usage, '                              and displays the results', String cr.
	usage := usage, ' suiteOrBenchmark   required, either a SMarkSuite with benchmarks,', String cr.
	usage := usage, '                              or a benchmark denoted by Suite.benchName', String cr.
	usage := usage, ' iterations         optional, number of times the benchmarks are repeated', String cr.
	usage := usage, ' processes          optional, number of processes/threads used by the benchmarks', String cr.
	usage := usage, ' problemSize        optional, depending on benchmark for instance number of', String cr.
	usage := usage, '                              inner iterations or size of used data set', String cr.
	
	RVMOperations print: usage.