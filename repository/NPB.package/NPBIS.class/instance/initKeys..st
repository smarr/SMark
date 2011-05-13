as yet unclassified
initKeys: aDouble
	| x k |
	k := maxKey / 4.
	
	1 to: numKeys do: [ :i |
		(i == 32769) ifTrue: [ Transcript show: 'Seed at: ', (rng seed asString);cr.].
		x := rng randlc: aDouble. 
		x := x + (rng randlc: aDouble).
		x := x + (rng randlc: aDouble).
		x := x + (rng randlc: aDouble).
		
		keyArray at: i put: (x * k) asInteger.
		].