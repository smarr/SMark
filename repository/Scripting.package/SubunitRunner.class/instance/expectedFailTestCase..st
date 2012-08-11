reporting
expectedFailTestCase: aTestCase
	stream nextPutAll: 'xfail: '.
	self   reportTestName: aTestCase.
	stream nextPut:    Character lf.
	stream flush.