benchmarking
benchInstVarAccess
	| i r |
	i := 50000.
	[i > 0] whileTrue: [
		r := someInstVar.
		someInstVar := nil.

		i := i - 1.
	].