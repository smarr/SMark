instance creation
boolean: aBoolean
	^ aBoolean
		ifTrue:  [ JSJsonLiteral TRUE ]
		ifFalse: [ JSJsonLiteral FALSE ]