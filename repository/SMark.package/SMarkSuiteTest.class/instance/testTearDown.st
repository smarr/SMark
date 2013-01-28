tests
testTearDown
	| suite runner |
	suite := SMarkTestSuite new.
	runner := SMarkTestRunner execute: suite.  
	
	self assert: 4 equals: runner tearDownCount.