as yet unclassified
piDigitsTo: n
   | i piDigits array |
   array := arrayFactory new: n.
   i := 1.
   
   piDigits := spigotFactory new.
   [i <= n] whileTrue:
      [ array at: i put: piDigits next.
	     i := i + 1 ].
	^ array