as yet unclassified
fullVerify
	" To save copy and memory sorting can be done directly: "
	| key idx count |
	key := 1. idx := 1.
	
	1 to: numKeys do: [ :i | 
		[ (idx == (masterHist at: key))
		   and: [ ((key >= maxKey)	or: [ idx >= numKeys ]) not ] ] whileTrue: [
			key := key + 1 
		].
		keyArray at: idx put: key.
		idx := idx + 1.
	].

	" Confirm keys correctly sorted: count incorrectly sorted keys, if any "
	count := 0.
	
	2 to: numKeys do: [ :i | 
		((keyArray at: (i - 1)) > (keyArray at: i)) ifTrue: [ count := count + 1]].

	(count ~= 0)
		ifTrue: [ ScriptConsole println: 'Full_verify: number of keys out of sort: '. count asString ]
		ifFalse: [ PassedVerification := PassedVerification + 1].
    
    ^ PassedVerification