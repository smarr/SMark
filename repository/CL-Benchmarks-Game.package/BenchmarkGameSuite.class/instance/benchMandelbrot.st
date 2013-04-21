benchmarking
benchMandelbrot
	| result bench problemSize |
	bench := BGMandelbrot new.
	problemSize := self problemSize ifNotNil: [:ps | ps ]
							                 ifNil:    [ BGMandelbrot defaultProblemSize ].
	result := bench mandelbrot2: problemSize.
	result reset.
	^ result contents