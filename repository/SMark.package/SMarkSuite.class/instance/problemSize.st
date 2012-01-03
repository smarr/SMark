benchmarking
problemSize
	runner             ifNil: [^ self class defaultProblemSize].
	runner problemSize ifNil: [^ self class defaultProblemSize].
	^ runner problemSize