benchmarking
runBench
	"self new runBench"
	| stateNeedsToBeThreadLocal |
	stateNeedsToBeThreadLocal := self class new.
	stateNeedsToBeThreadLocal problemSize: problemSize.
	stateNeedsToBeThreadLocal setup.
	stateNeedsToBeThreadLocal execute