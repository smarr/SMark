instance creation
newOfSizeClass: aSymbol with: numberOfThreads 
	| o |
	o := super new.
	o initializeWithSizeClass: aSymbol andNumberOfThreads: numberOfThreads.
	^o