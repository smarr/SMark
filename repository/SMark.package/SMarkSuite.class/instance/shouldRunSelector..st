testing
shouldRunSelector: selector
	"Tells whether the given selector is in the form bench*."
	
	(selector includes: $:) ifTrue: [ ^ false ].
	^ selector beginsWith: #bench