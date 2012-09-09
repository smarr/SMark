stone benchmarks
primesUpTo: n
	"modified by nishis"

	"Return the prime numbers between 2 and n.

	This method tests the efficiency of recursively calling a block
	that does some collection enumeration based on integer arithmetic."

	| nSqrt lowPrimes highPrimes genNext first |
	n < 5 | (n > 16363) ifTrue: [self error: 'Prime limit(s) out of range.'].
	nSqrt := n sqrt rounded.
	lowPrimes := OrderedCollection with: 2.
	highPrimes := 5 to: n by: 2.
	
	genNext := [:nextPrime |
		lowPrimes add: nextPrime.
		highPrimes := highPrimes select: [:k | k \\ nextPrime ~= 0].
		(first := highPrimes first) <= nSqrt ifTrue: [genNext value: first]].
	
	genNext value: 3.

	^lowPrimes , highPrimes