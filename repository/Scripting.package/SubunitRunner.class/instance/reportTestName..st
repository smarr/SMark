reporting
reportTestName: aTestCase
  stream
	nextPutAll: (aTestCase class category); nextPut: $.;
	nextPutAll: (aTestCase class name); nextPut: $.;
	nextPutAll: (aTestCase selector)