as yet unclassified
testCustomTearDown
	| suite |
	suite := SMarkTestSuite new.
	suite runner: self.
	
	didTearDownBenchC := false.
				
	suite run.
	
	self assert: didTearDownBenchC