reporting
expectedFailTestCase: aTestCase
	stream nextPut: Character lf.
	
	stream nextPutAll: 'xfail: '.
	self   reportTestName: aTestCase.
	stream nextPut:    Character lf.
	stream flush.