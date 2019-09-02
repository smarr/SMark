Class {
	#name : #JSJsonArray,
	#superclass : #JSJsonValue,
	#instVars : [
		'values'
	],
	#category : 'SMark-SOM-Json'
}

{ #category : #'instance creation' }
JSJsonArray class >> readFrom: string [
    ^ (JSJsonValue readFrom: string) asArray
]

{ #category : #comparing }
JSJsonArray >> = other [
    self == other ifTrue: [ ^ true ].
    other == nil ifTrue: [ ^ false ].
    self class == other class ifFalse: [ ^ false ].

    ^ values = other values
]

{ #category : #adding }
JSJsonArray >> add: value [
    value ifNil: [ self error: 'value is null' ].
    values add: value
]

{ #category : #adding }
JSJsonArray >> addBoolean: value [
    values add: (JSJsonValue boolean: value)
]

{ #category : #adding }
JSJsonArray >> addDouble: value [
	values add: (JSJsonValue double: value)
]

{ #category : #adding }
JSJsonArray >> addInteger: value [
    values add: (JSJsonValue integer: value)
]

{ #category : #adding }
JSJsonArray >> addString: value [
    values add: (JSJsonValue string: value)
]

{ #category : #converting }
JSJsonArray >> asArray [
	^ self
]

{ #category : #accessing }
JSJsonArray >> at: index [
	^ values at: index
]

{ #category : #accessing }
JSJsonArray >> at: index put: value [
    value ifNil: [ self error: 'value is null' ].
    values at: index put: value
]

{ #category : #accessing }
JSJsonArray >> at: index putBoolean: value [
    values at: index put: (JSJsonValue boolean: value)
]

{ #category : #accessing }
JSJsonArray >> at: index putDouble: value [
    values at: index put: (JSJsonValue double: value)
]

{ #category : #accessing }
JSJsonArray >> at: index putInteger: value [
    values at: index put: (JSJsonValue integer: value)
]

{ #category : #accessing }
JSJsonArray >> at: index putString: value [
    values at: index put: (JSJsonValue string: value)
]

{ #category : #hash }
JSJsonArray >> hashcode [
	^ values hash
]

{ #category : #initialization }
JSJsonArray >> initialize [
	values := OrderedCollection new.
]

{ #category : #testing }
JSJsonArray >> isArray [
	^ true
]

{ #category : #testing }
JSJsonArray >> isEmpty [
    ^ values isEmpty
]

{ #category : #removing }
JSJsonArray >> removeAt: index [
    values removeAt: index
]

{ #category : #accessing }
JSJsonArray >> size [
    ^ values size
]

{ #category : #accessing }
JSJsonArray >> values [
	^ values
]
