tests
testKNucleotide
	| input result |
	input  := ReadStream on: (BGFastaCache forFasta: BGKNucleotide defaultProblemSize).
	result := TextStream with: ByteString new.
	BGKNucleotide new knucleotide5From: input to: result.
	
	self assert: result contents equals: BGKNucleotide output.