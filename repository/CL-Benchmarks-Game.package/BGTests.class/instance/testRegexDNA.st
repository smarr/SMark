tests
testRegexDNA
	| output |
	output := TextStream with: String new.
	BGRegexDNA new regexDNA: BGRegexDNA input to: output.
	self assert: output contents equals: BGRegexDNA output