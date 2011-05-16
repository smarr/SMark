as yet unclassified
instructRunner
	suite := suiteClass new.
	specificBenchmark ifNotNil: [
			suite runOnly: specificBenchmark.
		].
	
	runner suite: suite.
 