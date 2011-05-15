helper
usage
	| usage |
	"Example usage: SMarkHarness SMarkRunner SMarkReporter SMarkLoops.benchIntLoop 1 1 5"
	usage := 'SMark Benchmark Framework, version: ', self version, String crlf.
	usage := usage, String crlf.
	usage := usage, 'Usage: <vm+image> SMarkHarness [runner] [reporter] <suiteOrBenchmark>', String crlf.
	usage := usage, '                               [iterations [processes [problemSize]]]', String crlf.
	usage := usage, String crlf.
	
	usage := usage, 'Arguments:', String crlf.
	usage := usage, ' runner             optional, a SMarkRunner class that executes the benchmarks', String crlf.
	usage := usage, ' reporter           optional, a SMarkReporter class that processes', String crlf.
	usage := usage, '                              and displays the results', String crlf.
	usage := usage, ' suiteOrBenchmark   required, either a SMarkSuite with benchmarks,', String crlf.
	usage := usage, '                              or a benchmark denoted by Suite.benchName', String crlf.
	usage := usage, ' iterations         optional, number of times the benchmarks are repeated', String crlf.
	usage := usage, ' processes          optional, number of processes/threads used by the benchmarks', String crlf.
	usage := usage, ' problemSize        optional, depending on benchmark for instance number of', String crlf.
	usage := usage, '                              inner iterations or size of used data set', String crlf.
	
	ScriptConsole print: usage.