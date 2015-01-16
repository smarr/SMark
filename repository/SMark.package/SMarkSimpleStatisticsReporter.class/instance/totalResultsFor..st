helper
totalResultsFor: aListOfResults
	^ aListOfResults collect: [:result | result total]
	