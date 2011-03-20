running
shouldRunSelector: selector
	(selector includes: $:) ifTrue: [ ^ false ].
	^ selector beginsWith: #bench