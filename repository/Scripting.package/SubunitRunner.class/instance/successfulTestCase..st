reporting
successfulTestCase: aTestCase
	stream nextPut: Character lf.
	
	stream 
	  nextPutAll: 'success: ';
	  nextPutAll: (aTestCase class category); nextPut: $.;
	  nextPutAll: (aTestCase class name); nextPut: $.;
	  nextPutAll: (aTestCase selector);
	  nextPut:    Character lf.
	  stream flush.