Class {
	#name : #JSJsonObject,
	#superclass : #JSJsonValue,
	#instVars : [
		'names',
		'values',
		'table'
	],
	#category : 'SOM-Benchmarks-Json'
}

{ #category : #'instance creation' }
JSJsonObject class >> readFrom: string [
	^ (JSJsonValue readFrom: string) asObject
]

{ #category : #comparing }
JSJsonObject >> = other [
    self == other ifTrue: [ ^ true  ].
    self == nil   ifTrue: [ ^ false ].
    self class == other class ifFalse: [ ^ false ].
    
    ^ names = other names & values = other values
]

{ #category : #adding }
JSJsonObject >> add: name with: aJsonValue [
    name ifNil: [ self error: 'name is null'  ].
    aJsonValue ifNil: [ self error: 'aJsonValue is null' ].

    names  add: name.
    values add: aJsonValue.
    table at: name put: names size.
]

{ #category : #adding }
JSJsonObject >> add: name withBoolean: value [
    self add: name with: (JSJsonValue boolean: value)
]

{ #category : #adding }
JSJsonObject >> add: name withNumber: value [
    self add: name with: (JSJsonValue number: value)
]

{ #category : #adding }
JSJsonObject >> add: name withString: value [
    self add: name with: (JSJsonValue string: value)
]

{ #category : #converting }
JSJsonObject >> asObject [
	^ self
]

{ #category : #accessing }
JSJsonObject >> at: name [
    | idx |
    name ifNil: [ self error: 'name is null'  ].
    idx := self indexOf: name.
    idx = -1
      ifTrue:  [ ^ nil ]
      ifFalse: [ ^ values at: idx ]
]

{ #category : #accessing }
JSJsonObject >> at: name asBooleanWith: default [
    | value |
    value := self at: name.
    value
      ifNil:    [ ^ default ]
      ifNotNil: [ ^ value asBoolean ]
]

{ #category : #accessing }
JSJsonObject >> at: name asDoubleWith: default [
    | value |
    value := self at: name.
    value
      ifNil:    [ ^ default ]
      ifNotNil: [ ^ value asDouble ]
]

{ #category : #accessing }
JSJsonObject >> at: name asIntegerWith: default [
    | value |
    value := self at: name.
    value
      ifNil:    [ ^ default ]
      ifNotNil: [ ^ value asInteger ]
]

{ #category : #accessing }
JSJsonObject >> at: name asStringWith: default [
    | value |
    value := self at: name.
    value
      ifNil:    [ ^ default ]
      ifNotNil: [ ^ value asString ]
]

{ #category : #accessing }
JSJsonObject >> at: name put: aJsonValue [
    | idx |
    name ifNil: [ self error: 'name is null'  ].
    aJsonValue ifNil: [ self error: 'aJsonValue is null' ].
  
    idx := self indexOf: name.
    idx <> -1
      ifTrue:  [values at: idx put: aJsonValue]
      ifFalse: [
        names  append: name.
        values append: aJsonValue.
        table at: name put: names size.
      ].
]

{ #category : #accessing }
JSJsonObject >> at: name putBoolean: value [
    self at: name put: (JSJsonValue boolean: value)
]

{ #category : #accessing }
JSJsonObject >> at: name putNumber: value [
    self at: name put: (JSJsonValue number: value)
]

{ #category : #accessing }
JSJsonObject >> at: name putString: value [
    self at: name put: (JSJsonValue string: value)
]

{ #category : #hash }
JSJsonObject >> hashcode [
	| result |
    result := 1.
    result := 31 * result + names hash.
    result := 31 * result + values hash.
    ^ result

]

{ #category : #accessing }
JSJsonObject >> indexOf: name [
    | idx |
    idx := table at: name.    
    idx ~= -1 & name = (names at: idx) ifTrue: [ ^ idx ].
    ^ names lastIndexOf: name
]

{ #category : #initialization }
JSJsonObject >> initialize [
    names  := OrderedCollection new.
    values := OrderedCollection new.
    table  := JSHashIndexTable new

]

{ #category : #testing }
JSJsonObject >> isEmpty [
	^ names isEmpty
]

{ #category : #testing }
JSJsonObject >> isObject [
	^ true
]

{ #category : #accessing }
JSJsonObject >> names [
	^ names
]

{ #category : #removing }
JSJsonObject >> remove: name [
    | idx |
    name ifNil: [ self error: 'name is null' ].
    idx := self indexOf: name.
    idx = -1 ifFalse: [
      table  remove: name.
      names  remove: idx.
      values remove: idx.
    ].
]

{ #category : #accessing }
JSJsonObject >> size [
	^ names size
]

{ #category : #hash }
JSJsonObject >> updateHashIndex [
    | size |
    size := names size.
    1 to: size do: [: i |
      table add: (names at: i) put: i
    ]
]
