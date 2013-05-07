accessing
forFasta: anInteger
	<omniUnenforced>
	Cache ifNil: [Cache := self new].
	^ Cache forFasta: anInteger