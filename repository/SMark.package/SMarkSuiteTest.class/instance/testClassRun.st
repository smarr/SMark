tests
testClassRun
	| runner |
	
	runner := SMarkTestSuite run.
	self assert: (runner isKindOf: SMarkTestSuite defaultRunner).
	self deny: runner results isNil    