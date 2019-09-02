Class {
	#name : #JSJsonValue,
	#superclass : #Object,
	#category : 'SMark-SOM-Json'
}

{ #category : #'instance creation' }
JSJsonValue class >> boolean: aBoolean [
	^ aBoolean
		ifTrue:  [ JSJsonLiteral TRUE ]
		ifFalse: [ JSJsonLiteral FALSE ]
]

{ #category : #helper }
JSJsonValue class >> cutOffPointZero: str [
    (str endsWith: '.0') ifTrue: [ ^ str substringFrom: 1 to: str length - 2].
    ^ str
]

{ #category : #'instance creation' }
JSJsonValue class >> double: aDouble [
	aDouble ifNil: [ self error: 'aDouble nil' ].
	^ JSJsonNumber new: (self cutOffPointZero: aDouble asString)
]

{ #category : #'instance creation' }
JSJsonValue class >> integer: anInteger [
	^ JSJsonNumber new: anInteger asString
]

{ #category : #'instance creation' }
JSJsonValue class >> readFrom: str [ 
	^ (JSJsonParser with: str) parse
]

{ #category : #'instance creation' }
JSJsonValue class >> string: aString [
	^ aString == nil
		ifTrue:  [ JSJsonLiteral NULL ]
		ifFalse: [ JSJsonString new: aString ]
]

{ #category : #converting }
JSJsonValue >> asArray [
	self error: 'Unsupported operation, not an array ' + self asString
]

{ #category : #converting }
JSJsonValue >> asBoolean [
	self error: 'Unsupported operation, not a boolean ' + self asString
]

{ #category : #converting }
JSJsonValue >> asDouble [
	self error: 'Unsupported operation, not a double ' + self asString
]

{ #category : #converting }
JSJsonValue >> asInteger [
	self error: 'Unsupported operation, not an integer ' + self asString
]

{ #category : #converting }
JSJsonValue >> asObject [
	self error: 'Unsupported operation, not an object: ' + self asString
]

{ #category : #converting }
JSJsonValue >> asString [
	self error: 'Unsupported operation, not a string ' + self asString
]

{ #category : #testing }
JSJsonValue >> isArray [
	^ false
]

{ #category : #testing }
JSJsonValue >> isBoolean [
	^ false
]

{ #category : #testing }
JSJsonValue >> isFalse [
	^ false
]

{ #category : #testing }
JSJsonValue >> isNull [
	^ false
]

{ #category : #testing }
JSJsonValue >> isNumber [
	^ false
]

{ #category : #testing }
JSJsonValue >> isObject [
	^ false
]

{ #category : #testing }
JSJsonValue >> isString [
	^ false
]

{ #category : #testing }
JSJsonValue >> isTrue [
	^ false
]

{ #category : #writing }
JSJsonValue >> writeOn: writer [
	^ self subclassResponsibility
]

{ #category : #writing }
JSJsonValue >> writeTo: writer [
	self writeTo: writer with: nil
]
