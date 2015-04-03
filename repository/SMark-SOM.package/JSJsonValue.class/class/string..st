instance creation
string: aString
	^ aString == nil
		ifTrue:  [ JSJsonLiteral NULL ]
		ifFalse: [ JSJsonString new: aString ]