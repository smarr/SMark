as yet unclassified
benchFloatLoop
	| a |
	a := 1.23.
	[a < 50000] whileTrue: [
		a := a + 0.6.
		a := a + 0.4.
	].