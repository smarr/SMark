as yet unclassified
testCriteria
	self assert: (result criteria respondsTo: #at:).
	self assert: (result criteria size > 0).