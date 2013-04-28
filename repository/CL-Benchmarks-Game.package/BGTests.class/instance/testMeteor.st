tests
testMeteor
	| result |
	result := BGMeteor meteor.
	self assert: result contents equals: BGMeteor output