benchmarking
fasta: anInt to: aStream
	self n:   anInt.
	self out: aStream.
	self oneHomoSapiensAlu.
	
   self r: (randomNumberFactory to: 1). "Shared random sequence"

	self twoIUBAmbiguityCodes.
	self threeHomoSapiensFrequency.
	
	aStream flush.