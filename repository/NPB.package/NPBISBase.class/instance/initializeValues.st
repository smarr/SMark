accessors
initializeValues
	"initialize the object after construction"
	totalKeys := 1 << self totalKeysLog2.
	maxKey := 1 << maxKeyLog2.
	numKeys := totalKeys.
	sizeOfBuffers := totalKeys.
	keyArray := Array new: sizeOfBuffers.
	masterHist := Array new: maxKey. 
	partialVerifyVals := Array new: NPBISBase testArraySize.
	masterHist doWithIndex: 
		[ :val :i | 
		masterHist 
			at: i
			put: 0 ]