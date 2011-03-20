as yet unclassified
testClassExecute
	| runner |
	runner := self runnerClass execute: SMarkTestSuiteWithBaseBenchmark new.
	
	self assert: (runner isKindOf: self runnerClass).