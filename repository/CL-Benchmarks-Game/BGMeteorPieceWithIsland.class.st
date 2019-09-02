Class {
	#name : #BGMeteorPieceWithIsland,
	#superclass : #BGMeteorPiece,
	#instVars : [
		'islands',
		'aPieceCouldFitIntoIsland'
	],
	#category : 'CL-Benchmarks-Game-Meteor'
}

{ #category : #testing }
BGMeteorPieceWithIsland >> fitOnBoard: aBoardMask [
    | occupied |
    ^0 == (aBoardMask bitAnd: mask) and:
        [(occupied := aBoardMask bitAnd: islands) = islands
            or: [aPieceCouldFitIntoIsland and: [(islands - occupied) bitCount = 5]]]
]

{ #category : #'initialize-release' }
BGMeteorPieceWithIsland >> islands: islandMask [
    islands := islandMask.
    aPieceCouldFitIntoIsland := islands bitCount >= 5
]
