as yet unclassified
testParseBenchmarkOrSuite
	| example1 example2 example3 example4 example5 |
	example1 := 'String>>findTokens:'.
	example2 := 'SMarkTestSuite'.
	example3 := { SMarkTestSuite. #benchA }.
	example4 := SMarkTestSuite.
	example5 := 'String.findTokens:'. ". (dot) notation is required to avoid quoting in bash"
	
	self assert: { String. #findTokens: }    equals: (parser parseBenchmarkOrSuite: example1).
	self assert: SMarkTestSuite              equals: (parser parseBenchmarkOrSuite: example2).
	self assert: { SMarkTestSuite. #benchA } equals: (parser parseBenchmarkOrSuite: example3).
	self assert: SMarkTestSuite              equals: (parser parseBenchmarkOrSuite: example4).
	self assert: { String. #findTokens: }    equals: (parser parseBenchmarkOrSuite: example5).
	
	"What to do when the input is not a symbol, array, or class?"
	
	"What to do when the class does not exist"
	self should: [parser parseBenchmarkOrSuite: 'FooBarClassThatDoesNotExist'] raise: Error.