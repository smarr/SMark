benchmarking
benchFloatLoop
	| a limit |
	a := 1.23.
	limit := self problemSize.
	[a < limit] whileTrue: [
		a := a + 0.6.
		a := a + 0.4.
	].