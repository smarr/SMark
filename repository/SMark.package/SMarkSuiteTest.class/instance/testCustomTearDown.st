as yet unclassified
testCustomTearDown
	| suite runner |
	suite := SMarkTestSuite new.
	runner := SMarkTestRunner execute: suite.  
	
	self assert: runner hasTearDownBenchC.