as yet unclassified
testNBody
	| result |
	result := BGNBody nbody: 1000.
	
	self assert: (((result at: 2) asString) beginsWith: '-0.169087605')