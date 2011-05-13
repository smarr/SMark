as yet unclassified
do: aStep
	self critical: [
		| thread |
		1 to: numThreads do: [ :m |
			thread := rankThreads at: m.
			thread critical: [
				thread state: aStep.
				thread notify.]].
	
		1 to: numThreads do: [ :m | 
			self wait.
		]
	].