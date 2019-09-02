Class {
	#name : #JSJsonLiteral,
	#superclass : #JSJsonValue,
	#instVars : [
		'value',
		'isNull',
		'isTrue',
		'isFalse'
	],
	#classVars : [
		'FALSE',
		'NULL',
		'TRUE'
	],
	#category : 'SMark-SOM-Json'
}

{ #category : #constants }
JSJsonLiteral class >> FALSE [
	^ FALSE
]

{ #category : #constants }
JSJsonLiteral class >> NULL [
	^ NULL
]

{ #category : #constants }
JSJsonLiteral class >> TRUE [
	^ TRUE
]

{ #category : #'class initialization' }
JSJsonLiteral class >> initialize [
   "self initialize"
	NULL := self basicNew initializeWith: 'null'.
	TRUE := self basicNew initializeWith: 'true'.
	FALSE:= self basicNew initializeWith: 'false'.
]

{ #category : #comparing }
JSJsonLiteral >> = other [
    self == other ifTrue: [ ^ true ].  
    other == nil ifTrue: [ ^ false ].
    self class == other class ifFalse: [ ^ false ].

    ^ value = other asString

]

{ #category : #converting }
JSJsonLiteral >> asBoolean [
	isNull ifTrue: [ ^ super asBoolean ]
	       ifFalse:[ ^ isTrue ]
]

{ #category : #converting }
JSJsonLiteral >> asString [
	^ value
]

{ #category : #hash }
JSJsonLiteral >> hashcode [
	^ value hash
]

{ #category : #initialization }
JSJsonLiteral >> initializeWith: val [
    value   := val.
    isNull  := 'null'  = val.
    isTrue  := 'true'  = val.
    isFalse := 'false' = val.
]

{ #category : #testing }
JSJsonLiteral >> isBoolean [
	^ isTrue | isFalse
]

{ #category : #accessing }
JSJsonLiteral >> isFalse [
	^ isFalse
]

{ #category : #accessing }
JSJsonLiteral >> isNull [
	^ isNull
]

{ #category : #accessing }
JSJsonLiteral >> isTrue [
	^ isTrue
]
