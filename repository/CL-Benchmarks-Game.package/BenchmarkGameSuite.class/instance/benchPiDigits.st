benchmarking
benchPiDigits
	| problemSize |
	problemSize := self problemSize ifNotNil: [:ps | ps ]
								  ifNil: [ BGPiDigits defaultProblemSize ].
	^ BGPiDigits piDigits: problemSize.