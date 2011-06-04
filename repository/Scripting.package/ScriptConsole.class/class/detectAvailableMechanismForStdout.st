as yet unclassified
detectAvailableMechanismForStdout
	"The RoarVM has its own primitive"
	| cls |
	cls := Smalltalk at: #RVMOperations ifAbsent: [nil].
	IsRVM := (cls notNil and: [cls perform: #isRVM]).
	IsRVM 
		ifTrue: [ 
			PrintTarget := cls.
			^ self.
		]
		ifFalse: [
			"Squeak 4.2 provides a stream at FileStream>>stdout"
			(FileStream respondsTo: #stdout)
				ifTrue: [
					PrintTarget := FileStream stdout.
					^ self.
				].
		].
	
	PrintTarget := nil.
	^ nil