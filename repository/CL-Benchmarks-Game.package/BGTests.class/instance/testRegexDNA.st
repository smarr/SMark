tests
testRegexDNA
	| output |
	output := TextStream with: String new.
	BGRegexDNA regexDNA: BGRegexDNA input to: output.
  self assert: output contents equals: BGRegexDNA output