as yet unclassified
initKeys
	| rng mySeed a x k |
	a := NPBIS amult.
	rng := NPBRandom new.
	mySeed := rng findSeedFor: (id - 1) with: numThreads of: (4 * totalKeys * 1) using: (NPBRandom seed) and: a.
	
	rng seed: mySeed.
	
	k := (maxKey / 4) asInteger.
    
	((start + numKeys) > (end + 1)) ifTrue: [self error: 'this here seems to be inconsistent'.].
	
	start to: end do: [:i |
		x := rng randlc: a.
		x := x + (rng randlc: a).
		x := x + (rng randlc: a).
		x := x + (rng randlc: a).
		keyArray at: i put: (x * k) asInteger.
		]