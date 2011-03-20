as yet unclassified
testCleanUpInstanceVariables
	| suite |
	suite := SMarkTestSuite new.
	suite runner: #dummy.
	
	self assert: suite runner	equals: #dummy.
	self assert: suite a			equals: 1.
	self assert: suite c			equals: #three.
				
	suite cleanUpInstanceVariables.
	
	self assert: suite runner	equals: #dummy.
	self assert: suite a			equals: nil.
	self assert: suite b			equals: nil.
	self assert: suite c			equals: nil.
	self assert: suite d			equals: nil.
