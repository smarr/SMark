benchmarking
benchStone
	"Using the SlopStone benchmarks, but not doing the
	 old style Stone performance number reporting"

	| n |
	n := self problemSize.
	n > SmallInteger maxVal
		ifTrue: [ self error: 'Count exceeded max small int.' ].
	
	o := obj new.
	
	1 to: n do: [:i | self doIntAdd         ].
	1 to: n do: [:i | self doFloatAdd       ].
	1 to: n do: [:i | self doStringAccess   ].
	1 to: n do: [:i | self doObjectCreation ].
	1 to: n do: [:i | self doObjectCopy     ].
	1 to: n do: [:i | self doPerform        ].
	1 to: n do: [:i | self doBlockValue     ].
