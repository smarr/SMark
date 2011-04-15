benchmarking
primesUpTo: n
	"modified by nishis"

	"Return the prime numbers between 2 and n.

	This method tests the efficiency of recursively calling a block
	that does some collection enumeration based on integer arithmetic."

	| nSqrt lowPrimes highPrimes genNext first nextPrime2 |
	n < 5 | (n > 16363) ifTrue: [self error: 'Prime limit(s) out of range.'].
	nSqrt := n sqrt rounded.
	lowPrimes := OrderedCollection with: 2.
	highPrimes := 5 to: n by: 2.
	IsSupportRecursiveBlock
		ifTrue:
			[genNext :=
				[:nextPrime |
				lowPrimes add: nextPrime.
				highPrimes := highPrimes select: [:k | k \\ nextPrime ~= 0].
				(first := highPrimes first) <= nSqrt ifTrue: [genNext value: first]].
			genNext value: 3.]
		ifFalse: 
			[first := highPrimes first.
			nextPrime2 := 3.
			[first <= nSqrt] 
				whileTrue: 
					[lowPrimes add: nextPrime2.
					highPrimes := highPrimes select: [:k | k \\ nextPrime2 ~= 0].
					(first := highPrimes first) <= nSqrt ifTrue: [nextPrime2 := first]]].
	^lowPrimes , highPrimes