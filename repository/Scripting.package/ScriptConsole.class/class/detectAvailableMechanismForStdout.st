initialization
detectAvailableMechanismForStdout
	"The prefered means is to use the stdout file handle.
	 Will try to fall back on the RoarVM primitive if necessary."
	| cls |
	cls := Smalltalk globals
		at: #Stdio
		ifAbsent: [
			cls := Smalltalk globals
			at: #FileStream
			ifAbsent: [ nil ] ].
	(cls notNil and: [
		cls respondsTo: #stdout ]) ifTrue: [
			PrintTarget := cls stdout.
			IsRVM := false. "Not needed when stdout is used"
			^ self.
		].
		
	cls := Smalltalk at: #RVMOperations ifAbsent: [nil].
	IsRVM := (cls notNil and: [cls perform: #isRVM]).
	IsRVM 
		ifTrue: [ 
			PrintTarget := cls.
			^ self.
		]
		ifFalse: [
			"Squeak 4.2 provides a stream at FileStream>>stdout"
			
		].
	
	PrintTarget := Transcript.
	^ Transcript