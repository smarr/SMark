"
Richards is an OS kernel simulation benchmark, originally written in BCPL by Martin Richards. The main focus in Richards is on property access and calling functions and methods.
"
Class {
	#name : #SMarkRichards,
	#superclass : #SMarkSuite,
	#category : 'SMark-Richards'
}

{ #category : #benchs }
SMarkRichards >> benchRichards [

	RichObject initialize.
	^ RichRunner start
]

{ #category : #benchs }
SMarkRichards >> defaultProblemSize [
	^ 50
]

{ #category : #benchs }
SMarkRichards >> problemSize [
	<omniUnenforced> "Hint for the OMOP that it is part of the meta infrastructure"
	| ps |
	ps := super problemSize.
	
	ps isInteger ifFalse: [	^ self defaultProblemSize].
		
	^ ps
]

{ #category : #benchs }
SMarkRichards >> verifyRichards: result [
	^ result
]
