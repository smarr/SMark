benchmarking
benchNBody
	| problemSize |
	problemSize := self problemSize ifNotNil: [ self problemSize ]
								  ifNil: [ BGNBody defaultProblemSize ].
	BGNBody nbody: problemSize.