Class {
	#name : #SomTowers,
	#superclass : #SomBenchmark,
	#instVars : [
		'piles',
		'movesdone'
	],
	#category : 'SOM-Benchmarks'
}

{ #category : #benchmarking }
SomTowers >> benchmark [
        piles := Array new: 4.
        self buildTowerAt: 1 disks: 13.
        movesdone := 0.
        self move: 13 disksFrom: 1 to: 2.
        ^ movesdone
]

{ #category : #towers }
SomTowers >> buildTowerAt: pile disks: disks [
        disks to: 0 by: -1 do: [ :i |
            self pushDisk: (SomTowersDisk new: i) onPile: pile ]
]

{ #category : #towers }
SomTowers >> move: disks disksFrom: fromPile to: toPile [
        disks = 1
            ifTrue: [ self moveTopDiskFrom: fromPile to: toPile ]
            ifFalse: [ | otherPile |
                otherPile := (6 - fromPile) - toPile.
                self move: disks - 1 disksFrom: fromPile to: otherPile.
                self moveTopDiskFrom: fromPile to: toPile.
                self move: disks - 1 disksFrom: otherPile to: toPile. ]

]

{ #category : #towers }
SomTowers >> moveTopDiskFrom: fromPile to: toPile [
        self pushDisk: (self popDiskFrom: fromPile) onPile: toPile.
        movesdone := movesdone + 1.
]

{ #category : #towers }
SomTowers >> popDiskFrom: pile [
        | top |
        
        top := piles at: pile.
        top isNil
            ifTrue: [
                self error: 'Attempting to remove a disk from an empty pile' ].
        
        piles at: pile put: top next.
        top next: nil.
        ^top
]

{ #category : #towers }
SomTowers >> pushDisk: disk onPile: pile [
        | top |
        
        top := piles at: pile.
        ((top isNil not) and: [ disk size >= top size ])
            ifTrue: [ self error: 'Cannot put a big disk on a smaller one' ].
        
        disk next: top.
        piles at: pile put: disk.
]

{ #category : #benchmarking }
SomTowers >> verifyResult: result [
      ^ self assert: 8191 equals: result
]
