as yet unclassified
testSetUp
	| suite |
	suite := SMarkTestSuite new.
	suite runner: self.
	
	self assert: suite a			equals: 1.
	self assert: suite b			equals: 2.
	self assert: suite c			equals: #three.
				
	suite run.
	
	"Make sure they are reset after each run,
	 well we test just whether they are reset after the final run"
	self assert: suite a			equals: nil.
	self assert: suite b			equals: nil.
	self assert: suite c			equals: nil.
	self assert: suite d			equals: nil.

	"Make sure setUp was called 3 times."
	
	self assert: setUpCount	equals: 4.