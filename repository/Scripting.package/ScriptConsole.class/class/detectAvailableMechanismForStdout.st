as yet unclassified
detectAvailableMechanismForStdout
	"The RoarVM has its own primitive"
	| cls |
	cls := Smalltalk at: #RVMOperations ifAbsent: [nil].
	(cls notNil and: [cls perform: #isRVM])
		ifTrue: [ 
			PrintAStringBlock := [:aString :lineEnd | cls print: aString ].
			^ PrintAStringBlock
		].
	
	"Squeak 4.2 provides a stream at FileStream>>stdout"
	(FileStream respondsTo: #stdout)
		ifTrue: [
			PrintAStringBlock := [:aString :lineEnd | FileStream stdout nextPutAll: (aString, lineEnd) ].
			^ PrintAStringBlock.
		].
	
	"Pharo and Squeak <4.2 do not have that..., so requires OSProcess"
	cls := Smalltalk at: #OSProcess ifAbsent: [nil].
	cls ifNotNil: [
			PrintAStringBlock := [:aString :lineEnd | cls thisOSProcess stdOut nextPutAll: (aString, lineEnd) ].
			^ PrintAStringBlock.
		].
	
	"Ok, else? When there is no PrintAStringBlock, we go to the Transcript"
	PrintAStringBlock := nil.
	^ nil