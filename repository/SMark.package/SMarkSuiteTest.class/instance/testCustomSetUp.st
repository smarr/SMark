tests
testCustomSetUp
	| suite runner |
	
	suite := SMarkTestSuite new.
	runner := SMarkTestRunner execute: suite.  
	
	self assert: runner hasSetUpBenchB