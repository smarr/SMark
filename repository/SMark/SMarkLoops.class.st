"
SMarkLoops implements a set of microbenchmarks measuring a number of basic aspects such as message send, instance field access, and array access cost.

Example use:
  (SMarkLoops new runOnly: #benchFloatLoop) run: 10 
"
Class {
	#name : #SMarkLoops,
	#superclass : #SMarkSuite,
	#instVars : [
		'someInstVar'
	],
	#classVars : [
		'ClassVarValue'
	],
	#category : 'SMark-Classic'
}

{ #category : #'as yet unclassified' }
SMarkLoops class >> defaultProblemSize [
	^ 50000
]

{ #category : #benchmarking }
SMarkLoops >> benchArrayAccess [
	| i obj array |
	
	array := Array new: 1.
	obj   := Object new.
	
	i := self problemSize.
	[i > 0] whileTrue: [
		array at: 1.
		array at: 1 put: obj.
		
		i := i - 1.
	].
]

{ #category : #benchmarking }
SMarkLoops >> benchClassVarBinding [
	| i r |
	i := self problemSize.
	[i > 0] whileTrue: [
		r := ClassVarValue.
		ClassVarValue := nil.

		i := i - 1.
	].
]

{ #category : #benchmarking }
SMarkLoops >> benchFloatLoop [
	| a limit |
	a := 1.23.
	limit := self problemSize.
	[a < limit] whileTrue: [
		a := a + 0.6.
		a := a + 0.4.
	].
]

{ #category : #benchmarking }
SMarkLoops >> benchInstVarAccess [
	| i r |
	i := self problemSize.
	[i > 0] whileTrue: [
		r := someInstVar.
		someInstVar := nil.

		i := i - 1.
	].
]

{ #category : #benchmarking }
SMarkLoops >> benchIntLoop [
	| i |
	i := self problemSize.
	[i > 0] whileTrue: [
		i := i - 1.
	].
]

{ #category : #benchmarking }
SMarkLoops >> benchSend [
	| i r |
	i := self problemSize.
	[i > 0] whileTrue: [
		self doNothing.
		i := i - 1.
	].
]

{ #category : #benchmarking }
SMarkLoops >> benchSendWithManyArguments [
	| i r |
	i := self problemSize.
	[i > 0] whileTrue: [
		self doNothingA: i b: i c: i d: i e: i f: i g: i h: i i: i j: i.
		i := i - 1.
	].
]

{ #category : #helper }
SMarkLoops >> doNothing [
]

{ #category : #helper }
SMarkLoops >> doNothingA: p1 b: p2 c: p3 d: p4 e: p5 f: p6 g: p7 h: p8 i: p9 j: p10 [
]
