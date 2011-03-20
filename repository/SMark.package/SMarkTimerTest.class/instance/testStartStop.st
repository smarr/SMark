as yet unclassified
testStartStop
	| timer |
	timer := SMarkTimer new.
	
	self assert: timer totalTime equals: 0.
	
	timer start.
	
	(Delay forMilliseconds: 10) wait.
	
	timer stop.
	
	self assert: (timer totalTime >= 10).