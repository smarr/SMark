helper
version
	(Smalltalk classNamed: #MCPackage) ifNotNilDo: [:mcp |
		| package |
		package := mcp named: 'SMark'.
		package hasWorkingCopy ifTrue: [
			^ package workingCopy ancestors first name.
		].
	].
	
	^ ''.