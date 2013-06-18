defaults
defaultOutputDestination
	^ Smalltalk globals at: #Transcript
	            ifAbsent: [SMarkReporter defaultOutputDestination]