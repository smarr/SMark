as yet unclassified
runBench
	" number of iterations is here used to define the tree size"
	^ self binarytrees: self problemSize asInteger to: (TextStream with: String new).