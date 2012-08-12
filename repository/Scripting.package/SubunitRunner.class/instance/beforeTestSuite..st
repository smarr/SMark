reporting
beforeTestSuite: aSuite
	stream nextPut: Character lf.
	
	stream nextPutAll: 'suite: ';    nextPutAll: aSuite name; nextPut: Character lf.
	stream nextPutAll: 'progress: '; nextPutAll: aSuite tests size asString; nextPut: Character lf.
	stream nextPutAll: 'time: '; nextPutAll: DateAndTime now asString; nextPut: Character lf.
	
	stream flush.
