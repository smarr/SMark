helper
recordResults: timer for: aSelector
	| result name |
	name := suite benchmarkNameForSelector: aSelector.
	
	result := SMarkResult new
		total: timer totalTime;
		benchmarkName: name;
		suite: suite;
		criteria: timers;
		yourself.
	
	(results at: name ifAbsentPut: OrderedCollection new) add: result.