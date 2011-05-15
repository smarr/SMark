as yet unclassified
testBinaryTreesResult
	| bench output |
	bench := BGBinaryTrees new.
				
	output := (TextStream with: String new).
	self assert: -1 equals: (bench binarytrees: 9 to: output).
	
	output := (TextStream with: String new).
	self assert: -1 equals: (bench binarytrees: 8 to: output).
	
	output := (TextStream with: String new).
	self assert: -1 equals: (bench binarytrees: 7 to: output).
	
	