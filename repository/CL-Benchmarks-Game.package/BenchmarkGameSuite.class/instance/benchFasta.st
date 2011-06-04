benchmarking
benchFasta
	| out problemSize |
	out := TextStream with: String new.
	problemSize := self problemSize ifNotNil: [ self problemSize asInteger ]
								  ifNil: [ BGFasta defaultProblemSize ].  
	BGFasta fasta: problemSize to: out.