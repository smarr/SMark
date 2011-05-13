as yet unclassified
step2
	"RVMTester print: 'do step 2 '."
	rStart to: rEnd do: [
		:i | 1 to: numThreads do: [
			:j | masterHist at: i incrementBy: ((rankThreads at: j) localHist at: i)]]