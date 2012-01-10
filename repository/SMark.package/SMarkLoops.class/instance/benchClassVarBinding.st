benchmarking
benchClassVarBinding
	| i r |
	i := self problemSize.
	[i > 0] whileTrue: [
		r := ClassVarValue.
		ClassVarValue := nil.

		i := i - 1.
	].