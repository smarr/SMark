benchmarking
benchSend
	| i r |
	i := 50000.
	[i > 0] whileTrue: [
		self doNothing.
		i := i - 1.
	].