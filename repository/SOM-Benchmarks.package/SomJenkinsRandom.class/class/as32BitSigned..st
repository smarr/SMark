converting
as32BitSigned: val
	| r |
	r := val bitAnd: 16rffffffff.
	(r bitAnd: 16r80000000) = 0 ifTrue: [ ^ r ].
	^ (16r100000000 - r) * -1
	