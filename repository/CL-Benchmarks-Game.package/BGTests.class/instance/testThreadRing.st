tests
testThreadRing
	| result |
	result := BGThreadRing threadring: 1000.
	self assert: result equals: 498