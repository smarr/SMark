helper
getSystemAttributes
	| arguments arg i |
	arguments := OrderedCollection new.
	i := 2.
	[[arg := SmalltalkImage current getSystemAttribute: i] value == nil]
		whileFalse: [arguments addLast: arg.
			i := i + 1].
	^ arguments