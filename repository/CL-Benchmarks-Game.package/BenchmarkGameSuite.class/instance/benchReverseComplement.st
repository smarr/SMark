benchmarking
benchReverseComplement
	| problemSize |
	problemSize := self problemSize ifNotNil: [:ps | ps ]
								  ifNil: [ BGReverseComplement defaultProblemSize ].
	
	BGReverseComplement revcomp: problemSize