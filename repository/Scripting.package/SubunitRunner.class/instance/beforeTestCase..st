reporting
beforeTestCase: aTestCase
	stream	nextPutAll: 'test: '.
	self   reportTestName: aTestCase.
	stream nextPut: Character lf.
	stream flush.