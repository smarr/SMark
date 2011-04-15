as yet unclassified
testSetUp
	| suite runner |
	suite := SMarkTestSuite new.
	
	self assert: suite a			equals: 1.
	self assert: suite b			equals: 2.
	self assert: suite c			equals: #three.
	
	runner := SMarkTestRunner execute: suite.
	
	"Make sure they are reset after each run,
	 well we test just whether they are reset after the final run"
	self assert: suite a			equals: nil.
	self assert: suite b			equals: nil.
	self assert: suite c			equals: nil.
	self assert: suite d			equals: nil.

	"Make sure setUp was called 4 times."
	
	self assert: 4 equals: runner setUpCount.