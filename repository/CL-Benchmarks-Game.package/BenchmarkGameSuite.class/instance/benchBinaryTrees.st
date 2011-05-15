benchmarking
benchBinaryTrees
	| bench |
	bench := BGBinaryTrees new.
	^ bench binarytrees: self problemSize asInteger to: (TextStream with: String new).