as yet unclassified
testTotalTimeWithResume
	| timer |
	timer := SMarkTimer new.
	self assert: timer totalTime equals: 0.
	
	timer start.
	(Delay forMilliseconds: 10) wait.
	timer stop.
	
	self assert: (timer totalTime >= 10).
	
	timer start.
	(Delay forMilliseconds: 10) wait.
	timer stop.
	
	self assert: (timer totalTime >= 20).
	
	timer start.
	(Delay forMilliseconds: 10) wait.
	timer stop.
	
	self assert: (timer totalTime >= 30).