benchmarking
benchBinaryTrees
	| bench problemSize |
	bench := BGBinaryTrees new.
	problemSize := self problemSize ifNotNil: [:ps | ps ]
							  ifNil: [ BGBinaryTrees defaultProblemSize ].
	^ bench binarytrees: problemSize to: (TextStream with: ByteString new).