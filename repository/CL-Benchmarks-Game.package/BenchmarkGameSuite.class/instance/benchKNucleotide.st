benchmarking
benchKNucleotide
	| bench input result problemSize output |
	problemSize := self problemSize ifNotNil: [:ps | ps ]
							            ifNil:    [ BGKNucleotide defaultProblemSize ].
	
	bench := BGKNucleotide new.
	input := ReadStream on: (BGFastaCache forFasta: problemSize).
	result := TextStream with: String new.
	output := bench knucleotide5From: input to: result.
	
	^ output