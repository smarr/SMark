as yet unclassified
testBinaryTreesResult
	| bench |
	bench := BGBinaryTrees new.
	bench problemSize: 9.
	self assert: bench runBench equals: -1.