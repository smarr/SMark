benchmarking
benchNBody
	| problemSize |
	problemSize := self problemSize ifNotNilDo: [:ps | ps asInteger ]
										  ifNil: [ BGNBody defaultProblemSize ].
	BGNBody nbody: problemSize.