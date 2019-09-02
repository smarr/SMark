Class {
	#name : #SomQueens,
	#superclass : #SomBenchmark,
	#instVars : [
		'freeMaxs',
		'freeRows',
		'freeMins',
		'queenRows'
	],
	#category : 'SOM-Benchmarks'
}

{ #category : #benchmarking }
SomQueens >> benchmark [
        | result |
        result := true.
        1 to: 10 do: [ :i | result := result and: self queens ].
        ^ result
]

{ #category : #queens }
SomQueens >> placeQueen: c [
        1 to: 8 do: [ :r | 
            (self row: r column: c)
                ifTrue: [
                    queenRows at: r put: c.
                    self row: r column: c put: false.
                    (c = 8) ifTrue: [ ^true ].
                    (self placeQueen: c + 1) ifTrue: [ ^true ].
                    self row: r column: c put: true ] ].
        ^false
]

{ #category : #queens }
SomQueens >> queens [
        freeRows  := Array new:  8 withAll: true.
        freeMaxs  := Array new: 16 withAll: true.
        freeMins  := Array new: 16 withAll: true.
        queenRows := Array new:  8 withAll: -1.
        ^ self placeQueen: 1
]

{ #category : #queens }
SomQueens >> row: r column: c [
        ^ (freeRows at: r) & (freeMaxs at: c + r) & (freeMins at: c - r + 8)

]

{ #category : #queens }
SomQueens >> row: r column: c put: v [
        freeRows at: r         put: v.
        freeMaxs at: c + r     put: v.
        freeMins at: c - r + 8 put: v
]

{ #category : #benchmarking }
SomQueens >> verifyResult: result [
      ^ result
]
