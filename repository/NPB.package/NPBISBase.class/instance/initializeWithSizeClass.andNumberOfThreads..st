as yet unclassified
initializeWithSizeClass: aSymbol andNumberOfThreads: numberOfThreads 
	| consts |
	
	consts := NPBISBase perform: aSymbol.
	consts keysAndValuesDo: 
		[ :key :val | 
		self
			perform: (key , ':') asSymbol
			with: val ].
	numThreads := numberOfThreads.
	
	benchmarkClass := aSymbol.
	
	self initializeValues.
	^ self