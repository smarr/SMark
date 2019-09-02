Class {
	#name : #SomSieve,
	#superclass : #SomBenchmark,
	#category : 'SOM-Benchmarks'
}

{ #category : #benchmarking }
SomSieve >> benchmark [
        | flags |
        flags  := Array new: 5000.
        ^ self sieve: flags size: 5000.
]

{ #category : #benchmarking }
SomSieve >> sieve: flags size: size [
        | primeCount |
        primeCount := 0.
        1 to: flags size do: [:i | flags at: i put: true ]. "#putAll:"

        2 to: size do: [ :i |
            (flags at: i - 1)
                ifTrue: [
                    | k |
                    primeCount := primeCount + 1.
                    k := i + i.
                    [ k <= size ]
                        whileTrue: [
                            flags at: k - 1 put: false. k := k + i ]. ] ].
        ^primeCount
]

{ #category : #benchmarking }
SomSieve >> verifyResult: result [
      ^ self assert: 669 equals: result
]
