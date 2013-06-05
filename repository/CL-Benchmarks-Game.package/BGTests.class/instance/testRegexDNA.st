tests
testRegexDNA
	| output input |
	input := BGFastaCache primeForFasta: BGRegexDNA defaultProblemSize.
	
	output := TextStream with: ByteString new.
	
	BGRegexDNA new regexDNA: input to: output.
	self assert: output contents equals: BGRegexDNA output