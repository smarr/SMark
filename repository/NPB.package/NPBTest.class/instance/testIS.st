tests
testIS
	| verified runner suite |
	runner := SMarkRunner new.
	suite  := NPBSuite new.
	suite runner: runner.
	runner suite: suite.
	runner iterations: 1.
	runner processes: 4.
	runner problemSize: #S.
	
	self shouldnt: [	runner execute. 
				"TODO: update as soon as the SMark framework supports verification"
				verified := false. ]
		 raise: Error.
	self assert: verified.