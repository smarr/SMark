reporting
beforeTestCase: aTestCase
	stream nextPut: Character lf.
	
	stream	nextPutAll: 'test: '.
	self   reportTestName: aTestCase.
	stream nextPut: Character lf.
	stream flush.