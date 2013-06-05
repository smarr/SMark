helpers
readFasta: sequenceName from: input
   | prefix newline buffer description line char |
   prefix := '>',sequenceName.
   newline := Character cr.

   "* find start of particular fasta sequence *"
   [(input atEnd) or: [
         (input peek = $>)
            ifTrue: [((line := input upTo: newline)
               indexOfSubCollection: prefix startingAt: 1) = 1]
            ifFalse: [input upTo: newline. false]]
      ] whileFalse.

   "* line-by-line read - it would be a lot faster to block read *"
   description := line.
   buffer := ReadWriteStream on: (ByteString new: 1028).
   [(input atEnd) or: [(char := input peek) = $>]] whileFalse: [
      (char = $;)
         ifTrue: [input upTo: newline]
         ifFalse: [buffer nextPutAll: (input upTo: newline)]
      ].
   ^ assocFact key: description value: buffer contents