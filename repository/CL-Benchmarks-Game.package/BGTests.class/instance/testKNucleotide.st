tests
testKNucleotide
	| input result |
	input  := ReadStream on: BGKNucleotide input.
	result := TextStream with: String new.
	BGKNucleotide new knucleotide5From: input to: result.
	
	self assert: result contents equals: BGKNucleotide output.