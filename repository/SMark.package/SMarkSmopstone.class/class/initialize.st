class initialization
initialize
	"added by nishis"
	"SmopstoneBenchmark initialize."

	| block |
	WhichFloatPrintOn := 7850 asFloat printString size = '7850.0' size.

	IsSupportRecursiveBlock := true.
	block := [:var | (var < 2) ifTrue: [block value: var + 1]].
	[block value: 1] 
		ifError: 
			[ :msg :rec | 
			IsSupportRecursiveBlock := false]
