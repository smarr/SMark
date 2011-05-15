benchmarking
benchIntLoop
	| i |
	i := 50000.
	[i > 0] whileTrue: [
		i := i - 1.
	].