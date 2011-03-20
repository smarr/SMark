as yet unclassified
testTearDown
	| suite |
	suite := SMarkTestSuite new.
	suite runner: self.
	
	self assert: tearDownCount		equals: 0.
	
	suite run.
	
	self assert: tearDownCount		equals: 4.