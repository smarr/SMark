tests
testAllBenchmarksForReturningThemSelf
	"This is a regression test to ensure that the old behavior worked in the first place"
	| allSuites |
	<timeout: 300>
	
	allSuites := SMarkSuite subclasses.
	
	allSuites do: [:suite |
		suite isAbstractClass ifFalse: [
			| runner results |
			Transcript show: (suite class name asString); cr.
			runner := suite run.
			results := runner results.
			self assert: (runner isKindOf: suite defaultRunner).
			self assert: 1 equals: runner iterations.
			self assert: (results size > 0).
		].
	].