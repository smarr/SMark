benchmarking
piDigitsTo: n into: array
   | i piDigits |
   
   i := 1.
   
   piDigits := BGPiDigitSpigot new.
   [i <= n] whileTrue:
      [ array at: i put: piDigits next.
	     i := i + 1 ].
	^ array