reporting
errorTestCase: aTestCase with: error stack: stack

	stream nextPutAll: 'error: '.
	self   reportTestName: aTestCase.
	self   reportCause: error stack: stack.
	stream flush.