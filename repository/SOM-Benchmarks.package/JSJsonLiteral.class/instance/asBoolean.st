converting
asBoolean
	isNull ifTrue: [ ^ super asBoolean ]
	       ifFalse:[ ^ isTrue ]