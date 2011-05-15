benchmarking
benchFasta
	| out problemSize |
	out := TextStream with: String new.
	problemSize := self problemSize ifNotNilDo: [:ps | ps asInteger ]
										  ifNil: [ BGFasta defaultProblemSize ].  
	BGFasta fasta: problemSize to: out.