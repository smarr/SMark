reporting
failedTestCase: aTestCase with: error stack: stack
	stream nextPut: Character lf.

	stream nextPutAll: 'failure: '.
	self   reportTestName: aTestCase.
	self   reportCause: error stack: stack.
	stream flush.