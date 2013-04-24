benchmarking
benchPiDigits
	| problemSize |
	problemSize := self problemSize ifNotNil: [ self problemSize ]
								  ifNil: [ BGPiDigits defaultProblemSize ].
	^ BGPiDigits piDigits: problemSize.