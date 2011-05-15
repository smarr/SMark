benchmarking
benchBinaryTrees
	| bench problemSize |
	bench := BGBinaryTrees new.
	problemSize := self problemSize ifNotNilDo: [:ps | ps asInteger ]
										  ifNil: [ BGBinaryTrees defaultProblemSize ].
	^ bench binarytrees: problemSize to: (TextStream with: String new).