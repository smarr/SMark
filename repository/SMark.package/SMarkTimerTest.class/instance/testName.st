tests
testName
	| timer |
	timer := SMarkTimer new.
	
	self assert: timer name equals: nil.
	
	timer name: #foo.
	
	self assert: timer name equals: #foo.