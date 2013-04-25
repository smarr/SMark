benchmarking
benchRegexDNA
	| problemSize |
	problemSize := self problemSize ifNotNil: [ self problemSize ]
								  ifNil: [ BGRegexDNA defaultProblemSize ].
	
	1 to: problemSize do: [:i |
		BGRegexDNA regexdna.
	]