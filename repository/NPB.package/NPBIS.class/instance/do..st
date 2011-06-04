as yet unclassified
do: aStep
	self critical: [
		rankThreads do: [ :thread |
			thread startStep: aStep.].
	
		rankThreads do: [ :ignored | 
			self wait.
		]
	].