benchmarking
benchFasta
	| out problemSize |
	out := TextStream with: ByteString new.
	problemSize := self problemSize
		ifNotNilDo: [:ps | ps ]
		ifNil:      [ BGFasta defaultProblemSize ].  
	BGFasta fasta: problemSize to: out.