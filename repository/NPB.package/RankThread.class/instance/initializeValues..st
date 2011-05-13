initialization
initializeValues: anIS
	numThreads := anIS numThreads.
	maxKey := anIS maxKey.
	
	keyArray := anIS keyArray.
	testIndexArray := anIS testIndexArray.
	masterHist := anIS masterHist.
	partialVerifyVals := anIS partialVerifyVals.
	totalKeys := anIS totalKeys.
	numKeys := (anIS numKeys / anIS numThreads * 1) asInteger.
