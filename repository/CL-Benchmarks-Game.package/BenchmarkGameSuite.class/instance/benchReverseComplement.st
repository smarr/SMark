benchmarking
benchReverseComplement
	| problemSize |
	problemSize := self problemSize ifNotNil: [ self problemSize ]
								  ifNil: [ BGReverseComplement defaultProblemSize ].
	
	1 to: problemSize do: [:i |
		BGReverseComplement revcomp.
	]