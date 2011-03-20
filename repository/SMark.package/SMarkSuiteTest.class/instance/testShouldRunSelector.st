as yet unclassified
testShouldRunSelector
	| suite |
	suite := SMarkSuite new.
	
	self assert: (suite shouldRunSelector: #benchSomething).
	self assert: (suite shouldRunSelector: #benchsomeThingElse).
	
	self deny: (suite shouldRunSelector: #nobenchSomeThing).
	self deny: (suite shouldRunSelector: #BenchSomeThing).