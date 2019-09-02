Class {
	#name : #JSJsonString,
	#superclass : #JSJsonValue,
	#instVars : [
		'string'
	],
	#category : 'SMark-SOM-Json'
}

{ #category : #'instance creation' }
JSJsonString class >> new: str [
	^ self basicNew initializeWith: str
]

{ #category : #comparing }
JSJsonString >> = other [
	self == other ifTrue: [ ^ true ].
	other == nil ifTrue: [ ^ false ].

	self class == other class ifFalse: [ ^ false ].

	^ string =  other asString
]

{ #category : #converting }
JSJsonString >> asString [
	^ string
]

{ #category : #hash }
JSJsonString >> hashcode [
	^ string hash
]

{ #category : #initialization }
JSJsonString >> initializeWith: str [
	string := str
]

{ #category : #testing }
JSJsonString >> isString [
	^ true
]
