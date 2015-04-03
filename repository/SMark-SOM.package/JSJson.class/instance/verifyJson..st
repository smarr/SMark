benchmarking
verifyJson: result
	result class = JSParseException ifTrue: [ result println ].
	result isObject ifFalse: [^ false].
	(result asObject at: 'head') isObject ifFalse: [^ false].
	(result asObject at: 'operations') isArray ifFalse: [^ false].
	^ (result asObject at: 'operations') asArray size = 156