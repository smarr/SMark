Class {
	#name : #JSJsonNumber,
	#superclass : #JSJsonValue,
	#instVars : [
		'string'
	],
	#category : 'SOM-Benchmarks-Json'
}

{ #category : #'as yet unclassified' }
JSJsonNumber class >> new: string [
    string ifNil: [ self error: 'string is null' ].
    ^ self new initializeWith: string

]

{ #category : #comparing }
JSJsonNumber >> = other [
    self == other ifTrue: [ ^ true ].
    other == nil ifTrue: [ ^ false ].
    
    self class == other class ifFalse: [ ^ false ].
    ^ string = other asString

]

{ #category : #converting }
JSJsonNumber >> asDouble [
	^ Float readFromString: string
]

{ #category : #converting }
JSJsonNumber >> asInteger [
	^ string asInteger
]

{ #category : #converting }
JSJsonNumber >> asString [
	^ string
]

{ #category : #hash }
JSJsonNumber >> hashcode [
	^ string hash
]

{ #category : #initialization }
JSJsonNumber >> initializeWith: str [
	string := str
]

{ #category : #testing }
JSJsonNumber >> isNumber [
	^ true
]
