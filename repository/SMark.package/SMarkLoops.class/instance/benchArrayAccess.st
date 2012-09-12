benchmarking
benchArrayAccess
	| i obj array |
	
	array := Array new: 1.
	obj   := Object new.
	
	i := self problemSize.
	[i > 0] whileTrue: [
		array at: 1.
		array at: 1 put: obj.
		
		i := i - 1.
	].