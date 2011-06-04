benchmarking
benchBinaryTrees
	| bench problemSize |
	bench := BGBinaryTrees new.
	problemSize := self problemSize ifNotNil: [ self problemSize asInteger ]
							  ifNil: [ BGBinaryTrees defaultProblemSize ].
	^ bench binarytrees: problemSize to: (TextStream with: String new).