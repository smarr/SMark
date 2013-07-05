tests
testIS
	| verified runner suite |
	runner := SMarkRunner new.
	suite  := NPBSuite new.
	suite runner: runner.
	runner suite: suite.
	runner iterations: 1.
	runner processes: 1.
	runner problemSize: #S.
	
	self flag: 'TODO: fix implementation for multiple processes on pharo!'.
	
	self shouldnt: [	runner execute. 
				"TODO: update as soon as the SMark framework supports verification"
				verified := false. ]
		 raise: Error.
	self flag: 'TODO: add verification'.
	"self assert: verified."