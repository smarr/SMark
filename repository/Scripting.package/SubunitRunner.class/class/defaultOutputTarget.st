defaults
defaultOutputTarget
	^ DefaultOutputTarget ifNil: [
		(Smalltalk hasClassNamed: #ScriptConsole) ifTrue: [^Smalltalk classNamed: #ScriptConsole].
		Transcript
		] ifNotNil: [DefaultOutputTarget]