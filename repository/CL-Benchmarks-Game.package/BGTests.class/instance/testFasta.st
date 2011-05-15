as yet unclassified
testFasta
	| result |
	self flag: 'TODO: add proper verification'.
	self shouldnt: [result := BGFasta fasta] raise: Error.
	self assert: (result size > 0).
	self assert: (result isKindOf: String).
	