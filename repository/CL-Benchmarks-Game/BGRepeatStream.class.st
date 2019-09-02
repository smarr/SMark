Class {
	#name : #BGRepeatStream,
	#superclass : #ReadStream,
	#instVars : [
		'repeatPtr',
		'repeatLimit'
	],
	#category : 'CL-Benchmarks-Game-Fasta'
}

{ #category : #'instance creation' }
BGRepeatStream class >> to: anInteger on: aCollection [
   ^(super on: aCollection) to: anInteger
]

{ #category : #testing }
BGRepeatStream >> atEnd [
   ^repeatPtr >= repeatLimit
]

{ #category : #accessing }
BGRepeatStream >> next [
	position >= readLimit ifTrue: [ self position: 0 ].
	repeatPtr := repeatPtr + 1.
	^ collection at: (position := position + 1)
]

{ #category : #'initialize-release' }
BGRepeatStream >> to: anInteger [
   repeatPtr := 0.
   repeatLimit := anInteger
]
