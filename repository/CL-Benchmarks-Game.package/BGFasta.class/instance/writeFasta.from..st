benchmarking
writeFasta: aString from: inStream
   | i |
   out nextPut: $>; nextPutAll: aString; cr.
   i := 0.
   [inStream atEnd] whileFalse:
      [i == lineLength ifTrue: [out cr. i := 0].
      out nextPut: inStream next.
      i := i + 1].
   out cr