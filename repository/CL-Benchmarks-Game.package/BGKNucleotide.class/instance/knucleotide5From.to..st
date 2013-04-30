benchmarking
knucleotide5From: input to: output
   "Same as av3, but create less strings while updating the frequencies"

   | sequence writeFrequencies writeCount |

   sequence := (self readFasta: 'THREE' from: input) value asUppercase.

   writeFrequencies :=
      [:k | | frequencies count |
      frequencies := sortCollectionFactory sortBlock: [:a :b|
      (a value = b value) ifTrue: [b key < a key] ifFalse: [b value < a value]].

   count := 0.0.
   (self substringFrequencies5On: sequence with: k using: (dictFactory new: 1024))
      associationsDo: [:each|
         frequencies add: each. count := count + each value].

   frequencies do: [:each | | percentage |
      percentage := (each value / count) * 100.0.

      output
         nextPutAll: each key; space;
         nextPutAll: (percentage printShowingDecimalPlaces: 3); cr]].

   writeCount := [:nucleotideFragment | | frequencies count |
      frequencies := self substringFrequencies5On: sequence with: nucleotideFragment size
         using: (dictFactory new: 1024).
      count := frequencies at: nucleotideFragment ifAbsent: [0].
      output print: count; tab; nextPutAll: nucleotideFragment; cr].

   writeFrequencies value: 1. output cr.
   writeFrequencies value: 2. output cr.

   writeCount value: 'GGT'.
   writeCount value: 'GGTA'.
   writeCount value: 'GGTATT'.
   writeCount value: 'GGTATTTTAATT'.
   writeCount value: 'GGTATTTTAATTTATAGT'