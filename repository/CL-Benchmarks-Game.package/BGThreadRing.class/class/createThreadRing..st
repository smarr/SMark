benchmark game
createThreadRing: completionBlock
	| first last |
	first := nil.
	last  := nil.
   503 to: 1 by: -1 do: [:i |
      first := BGThread named: i next: first done: completionBlock.
      last isNil ifTrue: [ last := first ].
   ].
   last nextThread: first.
   ^ first