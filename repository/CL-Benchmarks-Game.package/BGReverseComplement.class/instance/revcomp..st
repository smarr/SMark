benchmarking
revcomp: n
   | input output |
   input := RWBinaryOrTextStream with: (BGFastaCache forFasta: n).
   input reset.
   output := TextStream with: ByteString new.

   (arrayFact with: 'ONE' with: 'TWO' with: 'THREE') do: [:sequenceName |
		| fasta |
		fasta := self readFasta: sequenceName from: input.
		self reverseComplement: fasta value named: fasta key to: output.
   ].

   ^ output contents