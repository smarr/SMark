benchmarking
benchKNucleotide
	| bench input result problemSize output |
	problemSize := self problemSize ifNotNil: [:ps | ps ]
							            ifNil:    [ BGKNucleotide defaultProblemSize ].
	
	1 to: problemSize do: [:i | 
	    bench := BGKNucleotide new.
	    input := ReadStream on: BGKNucleotide input.
	    result := TextStream with: String new.
	    output := bench knucleotide5From: input to: result.
	].

	^ output