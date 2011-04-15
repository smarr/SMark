benchmarking
runBench
	"SmopstoneBenchmark new runBenchmark"
	| stateNeedsToBeThreadLocal |
	stateNeedsToBeThreadLocal := self class new.
	stateNeedsToBeThreadLocal problemSize: problemSize.
	stateNeedsToBeThreadLocal setup.
	stateNeedsToBeThreadLocal execute