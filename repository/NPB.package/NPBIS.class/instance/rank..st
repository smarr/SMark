as yet unclassified
rank: iteration
	keyArray at: (iteration + 1) put: iteration.
	keyArray at: (1 + iteration + (NPBISBase maxIterations)) put: (maxKey - iteration).
	
	1 to: NPBISBase testArraySize do: [
		:i | partialVerifyVals at: i put: (keyArray at: (1 + (testIndexArray at: i)) ) ].
	
	" Clear the work array "
	1 to: maxKey do: [ :i | masterHist at: i put: 0 ].
	
	" In the section, the keys themselves are used as their
	  own indexes to determine how many of each there are: their
	  individual population "
	1 to: numKeys do: [ :i | masterHist at: (1 + (keyArray at: i)) incrementBy: 1 ].
	" Now they have individual key population "
	
	" Density to Distribution conversion "
	1 to: (maxKey - 1) do: [ :i | masterHist at: (i + 1) incrementBy: (masterHist at: i). ].
	
	self partialVerify: iteration.