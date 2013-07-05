tests
testReverseComplement
	BGFastaCache primeForFasta: BGReverseComplement defaultProblemSize.
	self assert: BGReverseComplement revcomp equals: BGReverseComplement output 