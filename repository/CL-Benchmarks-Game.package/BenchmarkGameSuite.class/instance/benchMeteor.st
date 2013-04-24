benchmarking
benchMeteor
	| problemSize |
	problemSize := self problemSize ifNotNil: [ self problemSize ]
								  ifNil: [ BGMeteor defaultProblemSize ].
	^ BGMeteor meteor: problemSize.