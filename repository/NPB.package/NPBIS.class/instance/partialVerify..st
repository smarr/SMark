as yet unclassified
partialVerify: iteration
	| k offset |

	1 to: NPBISBase testArraySize do: [ :i |
		k := partialVerifyVals at: i.
		offset := iteration.
		( (0 <= k) and: [k <= (numKeys - 1)]) ifTrue: [
			(benchmarkClass == #S) ifTrue: [
					((i - 1) <= 2) ifTrue: [ offset := iteration. ]
						    ifFalse: [ offset := 0 - iteration.].
				].
			
			((masterHist at: k) ~= ((testRankArray at: i) + offset))
				ifTrue: [
					Error signal: 'Failed partial verification: iteration ', iteration asString, ', test key ', i asString ]
				ifFalse: [
					NPBISBase passedVerification: (NPBISBase passedVerification + 1). ]
			]
		]