helper
occurrencesOfRegex: regex in: aString
	| cnt |
	cnt := 0.
	aString regex: regex matchesCollect: [:match | cnt := cnt + 1].
	^ cnt