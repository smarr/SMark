benchmarking
benchThreadRing
	| problemSize |
	problemSize := self problemSize ifNotNil: [:ps | ps ]
								  ifNil: [ BGThreadRing defaultProblemSize ].
	^ BGThreadRing threadring: problemSize.