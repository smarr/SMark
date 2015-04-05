comparing
= other
	self == other ifTrue: [ ^ true ].
	other == nil ifTrue: [ ^ false ].

	self class == other class ifFalse: [ ^ false ].

	^ string =  other asString