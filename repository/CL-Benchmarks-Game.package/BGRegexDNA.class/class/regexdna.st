benchmarking
regexdna
	| output |
	output := TextStream with: String new.
   self new regexDNA: self input to: output.
   ^ output