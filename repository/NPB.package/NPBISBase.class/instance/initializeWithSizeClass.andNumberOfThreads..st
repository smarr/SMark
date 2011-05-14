as yet unclassified
initializeWithSizeClass: aSymbol andNumberOfThreads: numberOfThreads 
	| consts |
	benchmarkClass := aSymbol asSymbol.
		
	consts := NPBISBase perform: benchmarkClass.
	consts keysAndValuesDo: 
		[ :key :val | 
		self
			perform: (key , ':') asSymbol
			with: val ].
	numThreads := numberOfThreads.
	
	self initializeValues.
	^ self