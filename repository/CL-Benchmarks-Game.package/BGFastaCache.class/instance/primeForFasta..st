cache
primeForFasta: anInteger
	| out result |
   out := TextStream with: ByteString new.
   BGFasta fasta: anInteger to: out.
   
	result := out contents.
	cache at: anInteger put: result.
	^ result