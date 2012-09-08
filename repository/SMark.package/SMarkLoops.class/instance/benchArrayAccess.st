benchmarking
benchArrayAccess
	| i array |
	
	array := #( nil ).
	
	i := self problemSize.
	[i > 0] whileTrue: [
		array at: 1.
		array at: 1 put: nil.
		
		i := i - 1.
	].