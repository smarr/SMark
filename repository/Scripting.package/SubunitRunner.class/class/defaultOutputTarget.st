defaults
defaultOutputTarget
	^ DefaultOutputTarget ifNil: [Transcript] ifNotNil: [DefaultOutputTarget]