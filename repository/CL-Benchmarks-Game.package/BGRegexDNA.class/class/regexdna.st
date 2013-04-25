benchmarking
regexdna
	| output |
	output := TextStream with: String new.
   self regexDNA: self input to: output.
   ^ output