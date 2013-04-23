benchmarking
benchSpectralNorm
	| bench problemSize |
	bench := BGSpectralNorm new.
	problemSize := self problemSize ifNotNil: [:ps | ps ]
							                 ifNil:    [ BGSpectralNorm defaultProblemSize ].
	^ bench spectralnorm: problemSize.
