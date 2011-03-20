as yet unclassified
testBenchmarkWithMultipleCriteraTimers
	"Check whether the benchmark benchWithMultipleCriteria, really results in different unrelated timings"
	| runner result |
	runner := self runnerClass execute: SMarkTestSuite new.
	
	result := (runner results at: #WithMultipleCriteria) at: 1.
	self assert: (result isKindOf: SMarkResult).
	
	self assert: result benchmarkName equals: #WithMultipleCriteria.
	self assert: (result total >= 50).
	
	self assert: (result criteria notNil).
	self assert: (result criteria respondsTo: #at:).
	
	self assert: ((result criteria at: 't1') totalTime >= 10).
	self assert: ((result criteria at: 't2') totalTime >= 25).
	self assert: ((result criteria at: 't3') totalTime >= 50).
	