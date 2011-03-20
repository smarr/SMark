as yet unclassified
testCustomSetUp
	| suite |
	suite := SMarkTestSuite new.
	suite runner: self.
	
	didSetUpBenchB := false.
				
	suite run.
	
	self assert: didSetUpBenchB