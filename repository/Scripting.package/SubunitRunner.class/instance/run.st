running
run
	| execBlock |
	execBlock :=  [ [ 
			self setUp.
			suiteTime := [ self runAll ]
				timeToRun ]
					ensure: [ self tearDown. ] ].
	
	(Smalltalk at: #Author ifAbsent: [ 
		execBlock value.
		^ self ])
			uniqueInstance
				ifUnknownAuthorUse: 'TestConsoleRunner'
				during: execBlock.