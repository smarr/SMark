helper
executeRunFor: scriptClassName with: arguments
	| scriptClass |
	
	scriptClass := Smalltalk classNamed: scriptClassName.
	scriptClass ifNotNilDo: [:sc | scriptClass run: arguments].