benchmarking
regexdna: n
	| output input |
	input  := BGFastaCache forFasta: n.
	output := TextStream with: ByteString new.
   self new regexDNA: input to: output.
   ^ output