recursive method
generate: lastGen counts: counts
	"added by nishis"
	"SmopstoneBenchmark new sorcerersApprentice."

	| intersection isIncluded nextGen |
	
	counts add: lastGen size.
	nextGen := OrderedCollection new.
	lastGen do:
		[:r1 |
		lastGen do: 
			[:r2 | 
			(r1 origin ~= r2 origin or: [r1 corner ~= r2 corner])
			"In ST80 this test would have simply been r1 ~= r2"
				ifTrue:
					[(r1 intersects: r2)
						ifTrue:
							[intersection := r1 intersect: r2.
							isIncluded := false.                     "All these lines"
							nextGen do:                              "would have been"
								[:rec |                                "avoided if we"
									(rec origin = intersection origin and: "could have used"
									[rec corner = intersection corner])    "a set for"
										ifTrue: [isIncluded := true]].       "nextGen. See"
							isIncluded                               "explanation"
								ifFalse:                               "above."
									[nextGen size > 500
										ifTrue: [self error: 'Converges too slowly.']
										ifFalse: [nextGen add: intersection]]]]]].
		nextGen size > 0 ifTrue: [self generate: nextGen counts: counts].
	^counts