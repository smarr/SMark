benchmarking
benchRegexDNA
	| problemSize |
	problemSize := self problemSize ifNotNil: [:ps | ps ]
								  ifNil: [ BGRegexDNA defaultProblemSize ].
	
	BGRegexDNA regexdna: problemSize