as yet unclassified
detectAvailableMechanismForStdout
	"The RoarVM has its own primitive"
	((Smalltalk hasClassNamed: 'RVMOperations')
		and: [(Smalltalk at: #RVMOperations) perform: #isRVM])
		ifTrue: [ 
			PrintAStringBlock := [:aString | RVMOperations print: aString ].
			^ PrintAStringBlock
		].
	
	"Squeak 4.2 provides a stream at FileStream>>stdout"
	(FileStream respondsTo: #stdout)
		ifTrue: [
			PrintAStringBlock := [:aString | FileStream stdout nextPutAll: aString ].
			^ PrintAStringBlock.
		].
	
	"Pharo and Squeak <4.2 do not have that..., so requires OSProcess"
	(Smalltalk hasClassNamed: 'OSProcess')
		ifTrue: [
			PrintAStringBlock := [:aString | OSProcess thisOSProcess stdOut nextPutAll: aString ].
			^ PrintAStringBlock.
		].
	
	"Ok, else? When there is no PrintAStringBlock, we go to the Transcript"
	PrintAStringBlock := nil.
