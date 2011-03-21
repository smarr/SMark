accessing
report
	self header.
	
	runner results keysAndValuesDo: [:key :value |
		self benchmarkHeader: key.
		self reportAllRuns: value.
		self benchmarkFooter: key.
	].

	self footer.
	^ self