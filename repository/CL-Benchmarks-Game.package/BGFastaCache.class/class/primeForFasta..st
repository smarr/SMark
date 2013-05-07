accessing
primeForFasta: anInteger
	<omniUnenforced>
	Cache ifNil: [Cache := self new].
	^ Cache primeForFasta: anInteger