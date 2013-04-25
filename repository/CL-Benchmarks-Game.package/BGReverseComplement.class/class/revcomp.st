as yet unclassified
revcomp
   | input output |
   input := RWBinaryOrTextStream with: self input.
   input reset.
   output := TextStream with: String new.

   #('ONE' 'TWO' 'THREE') do:
      [:sequenceName|   | fasta |
         fasta := self readFasta: sequenceName from: input.
         self reverseComplement: fasta value named: fasta key to: output.
      ].

   ^ output contents