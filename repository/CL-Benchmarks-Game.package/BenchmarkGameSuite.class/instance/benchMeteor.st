benchmarking
benchMeteor
	| problemSize |
	problemSize := self problemSize ifNotNil: [:ps | ps ]
								  ifNil: [ BGMeteor defaultProblemSize ].
	^ BGMeteor meteor: problemSize.