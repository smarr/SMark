as yet unclassified
testAllBenchmarksForReturningThemSelf
	"This is a regression test to ensure that the old behavior worked in the first place"
	| allSuites |
	
	allSuites := SMarkSuite subclasses.
	
	allSuites do: [:suite |
		suite isAbstractClass ifFalse: [
			| result |
			result := suite run.
			self assert: (result isKindOf: suite defaultRunner).
			self assert: result iterations equals: 1.
		].
	].