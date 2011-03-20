as yet unclassified
testReset
	| timer |
	timer := SMarkTimer new.
	
	timer start.
	(Delay forMilliseconds: 10) wait.
	timer stop.
	
	self assert: (timer totalTime >= 10).
	
	timer reset.
	
	self assert: timer totalTime equals: 0.