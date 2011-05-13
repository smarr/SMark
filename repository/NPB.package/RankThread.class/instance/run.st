running
run
	[true] whileTrue: [
		"RVMOperations print: 'RankThread waiting id=.', id asString."
		self wait.
		
		self critical: [
			"RVMOperations print: 'RankThread entered run critical Id=', id asString."
					
			(state == #quit)
				ifTrue: [
					master notify. 
					^self
				]
				ifFalse: [
					self perform: state.
					master notify.
				].
		]
	]