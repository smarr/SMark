tests
testBinaryTrees
	| bench output expected |
	bench := BGBinaryTrees new.
	output := (TextStream with: ByteString new).

	self assert: -1 equals: (bench binarytrees: 10 to: output).
	
	expected := 'stretch tree of depth 11	 check: -1
2048	 trees of depth 4	 check: -2048
512	 trees of depth 6	 check: -512
128	 trees of depth 8	 check: -128
32	 trees of depth 10	 check: -32
long lived tree of depth 10	 check: -1
'.
	self assert: expected equals: output contents.