tests
testResultStructure
	| runner results resultA resultB suite |
	suite := SMarkTestSuite new.
	runner := self runnerClass execute: suite.
	results := runner results.
	
	"Don't care whether it is a dictionary, but at least it should present us something that maps benchmark names to result objects"
	self assert: (results respondsTo: #at:).

	resultA := (results at: #A) at: 1.
	resultB := (results at: #B) at: 1.


	self assert: (resultA isKindOf: SMarkResult).
	self assert: (resultB isKindOf: SMarkResult).
	self assert: (((results at: #C) at: 1) isKindOf: SMarkResult).
	
	"Make sure some properties of the result objects is ensured"
	self assert: resultA total > 0.
	self assert: #A equals: resultA benchmarkName.
	self assert: suite equals: resultA suite.
	self assert: 1 equals: resultA criteria size.
	
	self assert: resultB total > 0.
	self assert: #B equals: resultB benchmarkName.
	self assert: suite equals: resultB suite.
	self assert: 1 equals: resultB criteria size.
	"Testing for multi-criteria results somewhere else"