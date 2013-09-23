benchmarking
benchDeltaBlue
	"This the combined benchmark."
	
	| n |
	
	n := self problemSize.
	n > SmallInteger maxVal
		ifTrue: [ self error: 'Count exceeded max small int.' ].
	
	DBStrength initialize.
	
	self doChain: n. 
	self doProjection: n