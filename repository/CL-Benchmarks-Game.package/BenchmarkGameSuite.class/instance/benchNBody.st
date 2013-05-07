benchmarking
benchNBody
	| problemSize |
	problemSize := self problemSize ifNotNil: [:ps | ps ]
								  ifNil: [ BGNBody defaultProblemSize ].
	BGNBody nbody: problemSize.