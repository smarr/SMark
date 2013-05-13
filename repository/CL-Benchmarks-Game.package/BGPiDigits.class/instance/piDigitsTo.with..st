benchmarking
piDigitsTo: n with: piDigits
   | i array |
   array := arrayFactory new: n.
   i := 1.
   
   [i <= n] whileTrue:
      [ array at: i put: piDigits next.
	     i := i + 1 ].
	^ array