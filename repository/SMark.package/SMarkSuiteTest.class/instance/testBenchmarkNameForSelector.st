tests
testBenchmarkNameForSelector
	| suite |
	suite := SMarkSuite new.
	
	self assert: (suite benchmarkNameForSelector: #benchSomething) equals: #Something.
	self assert: (suite benchmarkNameForSelector: #benchsomeThingElse) equals: #someThingElse.
	
	self assert: (suite benchmarkNameForSelector: #nobenchSomeThing) equals: #nobenchSomeThing.
	self assert: (suite benchmarkNameForSelector: #BenchSomeThing) equals: #BenchSomeThing.