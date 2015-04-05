converting
assert: expected equals: value
	expected = value ifFalse: [
		self error: 'Expected value (', expected asString,
						') differs from actual (', value asString, ') benchmark result.'].
	^ true