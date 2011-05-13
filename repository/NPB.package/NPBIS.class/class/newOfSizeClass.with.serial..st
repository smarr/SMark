instance creation
newOfSizeClass: aSymbol with: nThreads serial: aBool
	| o |
	o := super new.
	
	o initializeWithSizeClass: aSymbol andNumberOfThreads: nThreads.
	
	o serial: aBool.
	o rng: NPBRandom new.
	^o
	
	
