Class {
	#name : #SomPermute,
	#superclass : #SomBenchmark,
	#instVars : [
		'count',
		'v'
	],
	#category : 'SOM-Benchmarks'
}

{ #category : #benchmarking }
SomPermute >> benchmark [
        count := 0.
        v     := Array new: 7.
        self permute: 6.
        ^ count
]

{ #category : #benchmarking }
SomPermute >> permute: n [
        count := count + 1.
        (n ~= 0)
            ifTrue: [
                self permute: n - 1.
                n to: 1 by: -1 do: [ :i |
                    self swap: n with: i.
                    self permute: n - 1.
                    self swap: n with: i ] ]
]

{ #category : #accessing }
SomPermute >> swap: i with: j [
        | tmp |
        tmp := v at: i.
        v at: i put: (v at: j).
        v at: j put: tmp
]

{ #category : #benchmarking }
SomPermute >> verifyResult: result [
      ^ self assert: 8660 equals: result
]
