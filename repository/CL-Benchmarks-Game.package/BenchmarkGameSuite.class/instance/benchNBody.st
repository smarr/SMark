benchmarking
benchNBody
	| problemSize |
	problemSize := self problemSize ifNotNil: [ self problemSize asInteger ]
								  ifNil: [ BGNBody defaultProblemSize ].
	BGNBody nbody: problemSize.