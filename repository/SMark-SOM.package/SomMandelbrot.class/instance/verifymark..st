as yet unclassified
verifymark: result
	  self problemSize = 750 ifTrue: [
        ^ result = 50
      ].
      firstResult isNil ifTrue: [
        firstResult := result.
      ].
      ^ result = firstResult