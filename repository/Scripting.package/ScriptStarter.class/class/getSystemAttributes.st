helper
getSystemAttributes
	| arguments arg i |
	arguments := OrderedCollection new.
	i := 2.
	[[arg := Smalltalk vm getSystemAttribute: i] value == nil]
		whileFalse: [arguments addLast: arg.
			i := i + 1].
	^ arguments