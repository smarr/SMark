as yet unclassified
benchArrayAccess
	| i array |
	
	array := #( nil ).
	
	i := 50000.
	[i > 0] whileTrue: [
		array at: 1.
		array at: 1 put: nil.
		
		i := i - 1.
	].