helper
parseBenchmarkOrSuite: aBenchmarkOrSuite
	"Identify the benchmark suite or suite and benchmark method
	 that should be executed. The string should be of the format 'Class>>benchName' or 'Class.benchName' for shell/bash compatibility.
	 Accepts a string, class, or array.
	 Returns, a class, or an array of a class and a symbol."
	| parsed suite benchmark |
	(aBenchmarkOrSuite isKindOf: Class)
		ifTrue: [^ aBenchmarkOrSuite].
	
	  
	(aBenchmarkOrSuite isKindOf: Array)
		ifTrue:  [ parsed := aBenchmarkOrSuite. ]
		ifFalse: [ parsed := aBenchmarkOrSuite findTokens: '>.'. ].
	
	((parsed size > 2) or: [parsed size < 1])
				ifTrue: [ Error signal: 'The passed argument has to represent two elements. A class/classname and a method symbol' ].
	
	suite := parsed first.
	
	(suite isKindOf: Class) 
		ifFalse: [ suite := Smalltalk at: (suite asSymbol) ifAbsent: [Error signal: 'Class that was supposed to represent a benchmark suite was not found: ', suite asString ]].
	
	parsed size = 1
		ifTrue: [^suite].

	benchmark := parsed second asSymbol.
	
	^ { suite. benchmark }
