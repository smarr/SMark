cache
primeForFasta: anInteger
	| out |
   out := TextStream with: String new.
   BGFasta fasta: anInteger to: out.
   
   cache at: anInteger put: out contents 