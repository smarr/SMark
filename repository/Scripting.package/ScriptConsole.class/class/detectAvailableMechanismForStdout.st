initialization
detectAvailableMechanismForStdout
	"The prefered means is to use the stdout file handle.
	 Will try to fall back on the RoarVM primitive if necessary."
	| cls |
	(FileStream respondsTo: #stdout)
		ifTrue: [
			PrintTarget := FileStream stdout.
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