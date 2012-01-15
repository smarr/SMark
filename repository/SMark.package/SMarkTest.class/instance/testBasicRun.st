tests
testBasicRun
	| runner results benchResult result |
	
	runner := SMarkLoops run.
	results := runner results.
	result := (results at: #IntLoop).
	
	self assert: (result isKindOf: Collection).
	self assert: result size equals: 1.
	
	benchResult := result at: 1.
	self assert: (benchResult isKindOf: SMarkResult).
	self assert: (benchResult total notNil).
	