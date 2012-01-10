benchmarking
benchSend
	| i r |
	i := self problemSize.
	[i > 0] whileTrue: [
		self doNothing.
		i := i - 1.
	].