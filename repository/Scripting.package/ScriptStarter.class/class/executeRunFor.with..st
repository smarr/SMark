helper
executeRunFor: scriptClassName with: arguments
	| scriptClass |
	scriptClass := Smalltalk classNamed: scriptClassName.
	scriptClass ifNotNil: [scriptClass run: arguments].