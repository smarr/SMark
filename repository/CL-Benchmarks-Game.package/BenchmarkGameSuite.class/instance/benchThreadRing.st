benchmarking
benchThreadRing
	| problemSize |
	problemSize := self problemSize ifNotNil: [ self problemSize ]
								  ifNil: [ BGThreadRing defaultProblemSize ].
	^ BGThreadRing threadring: problemSize.