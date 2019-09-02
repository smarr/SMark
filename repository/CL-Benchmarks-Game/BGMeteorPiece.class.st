Class {
	#name : #BGMeteorPiece,
	#superclass : #Object,
	#instVars : [
		'mask',
		'row'
	],
	#category : 'CL-Benchmarks-Game-Meteor'
}

{ #category : #helpers }
BGMeteorPiece >> fillSolution: aString ncol: ncol withColor: c [ 
    | offset |
    offset := row * ncol.
    mask bitsDo: [:k | aString at: offset + k put: c]
]

{ #category : #testing }
BGMeteorPiece >> fitOnBoard: aBoardMask [
    ^0 == (aBoardMask bitAnd: mask)
]

{ #category : #'initialize-release' }
BGMeteorPiece >> forRow: rowOffset [
    row := rowOffset
]

{ #category : #accessing }
BGMeteorPiece >> mask [
    ^ mask
]

{ #category : #'initialize-release' }
BGMeteorPiece >> mask: aPieceMask [
    mask := aPieceMask
]
