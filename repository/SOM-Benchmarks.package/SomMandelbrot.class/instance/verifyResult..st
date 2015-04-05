benchmarking
verifyResult: result
	   innerIterations = 750 ifTrue: [
        ^ result = 50
      ].
      firstResult isNil ifTrue: [
        firstResult := result.
      ].
      ^ result = firstResult