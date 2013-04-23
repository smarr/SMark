tests
testSpectralNorm
	| result |
	result := BGSpectralNorm new spectralnorm: 100.
	self assert: (result printShowingDecimalPlaces: 9) equals: '1.274219991'