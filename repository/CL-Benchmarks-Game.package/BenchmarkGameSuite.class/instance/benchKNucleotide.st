benchmarking
benchKNucleotide
	| bench input result |
	bench := BGKNucleotide new.
	input := ReadStream on: BGKNucleotide input.
	result := TextStream with: String new.
	^ bench knucleotide5From: input to: result