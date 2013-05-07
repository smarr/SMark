tests
testRegexDNA
	| output input |
	input := BGFastaCache forFasta: BGRegexDNA defaultProblemSize.
	
	output := TextStream with: String new.
	
	BGRegexDNA new regexDNA: input to: output.
	self assert: output contents equals: BGRegexDNA output