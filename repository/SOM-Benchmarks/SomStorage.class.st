Class {
	#name : #SomStorage,
	#superclass : #SomBenchmark,
	#instVars : [
		'count'
	],
	#category : 'SOM-Benchmarks'
}

{ #category : #benchmarking }
SomStorage >> benchmark [
        SomRandom initialize.
        count := 0.
        self buildTreeDepth: 7.
        ^ count
]

{ #category : #benchmarking }
SomStorage >> buildTreeDepth: depth [
        count := count + 1.
        ^(depth = 1) 
            ifTrue:  [ Array new: SomRandom next % 10 + 1 ]
            ifFalse: [
	             | arr |
	             arr := Array new: 4.
	             1 to: 4 do: [:i | arr at: i put: (self buildTreeDepth: depth - 1).
		          arr ] ]

]

{ #category : #benchmarking }
SomStorage >> verifyResult: result [
      ^ self assert: 5461 equals: result
]
