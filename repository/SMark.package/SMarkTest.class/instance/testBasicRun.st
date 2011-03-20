as yet unclassified
testBasicRun
	| runner results benchResult result |
	
	runner := PBFloat run.
	results := runner results.
	result := (results at: #Add).
	
	self assert: (result isKindOf: Collection).
	self assert: result size equals: 1.
	
	benchResult := result at: 1.
	self assert: (benchResult isKindOf: SMarkResult).
	self assert: (benchResult total notNil).
	