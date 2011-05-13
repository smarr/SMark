as yet unclassified
step1
	"RVMTester print: 'do step 1 '."
	
	keyArray at: (Iteration + 1) put: Iteration.
	keyArray at: (1 + Iteration + (NPBISBase maxIterations)) put: (maxKey - Iteration).
	
	1 to: NPBISBase testArraySize do: [
		:i | partialVerifyVals at: i put: (keyArray at: (1 + (testIndexArray at: i)))].
	
	1 to: maxKey do: [
		:i | localHist at: i put: 0].
	
	start to: end do: [
		:i | localHist at: (1 + (keyArray at: i)) incrementBy: 1].
	
	1 to: (maxKey - 1) do: [
		:i | localHist at: (i + 1) incrementBy: (localHist at: i)]