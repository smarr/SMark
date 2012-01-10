benchmarking
benchIntLoop
	| i |
	i := self problemSize.
	[i > 0] whileTrue: [
		i := i - 1.
	].