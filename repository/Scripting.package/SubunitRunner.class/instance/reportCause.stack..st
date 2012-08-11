reporting
reportCause: error stack: stack.	
	stream nextPutAll: ' ['; nextPut: Character lf.
	stream
		tab; nextPutAll: 'type: '; nextPutAll: (error class name); nextPut: Character lf;
		tab; nextPutAll: 'message:'; nextPutAll: (error messageText ifNil: [ error description ]); nextPut: Character lf;
		tab; nextPutAll: 'stack trace:'; nextPut: Character lf;
		nextPutAll: stack;
		nextPut: Character lf;
		nextPutAll: ']'; nextPut: Character lf