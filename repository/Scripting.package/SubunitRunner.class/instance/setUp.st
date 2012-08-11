running
setUp
	self beforeTestSuite: suite.
	
	"Initialize the test resources."
	suite resources do: [ :each |
		each isAvailable
			ifFalse: [ each signalInitializationError ] ]