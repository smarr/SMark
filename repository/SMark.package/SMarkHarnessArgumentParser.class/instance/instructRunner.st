argument parsing
instructRunner
	suite := suiteClass new.
	specificBenchmark ifNotNil: [
		suite runOnly: specificBenchmark.
	].
	
	runner suite: suite.
 