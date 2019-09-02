Class {
	#name : #JSHashIndexTable,
	#superclass : #Object,
	#instVars : [
		'hashTable'
	],
	#category : 'SMark-SOM-Json'
}

{ #category : #accessing }
JSHashIndexTable >> at: name [
    | slot |
    slot := self hashSlotFor: name.

    " subtract 1, 0 stands for empty "
    ^ ((hashTable at: slot) & 255) - 1
]

{ #category : #accessing }
JSHashIndexTable >> at: name put: index [
    | slot |
    slot := self hashSlotFor: name.
    
    index < 255
      ifTrue:  [ hashTable at: slot put: index + 1 ]
      ifFalse: [ hashTable at: slot put: 0 ]
]

{ #category : #hash }
JSHashIndexTable >> hashSlotFor: element [
    ^ (element hash & 31) + 1
]

{ #category : #initialization }
JSHashIndexTable >> initialize [
	hashTable := IntegerArray new: 32 withAll: 0
]

{ #category : #removing }
JSHashIndexTable >> remove: index [
    1 to: hashTable size do: [:i |
      index + 1 = (hashTable at: i)
        ifTrue:  [ hashTable at: i put: 0 ]
        ifFalse: [ 
          (hashTable at: i) > index + 1 ifTrue: [
            hashTable at: i put: (hashTable at: i) - 1]]]
]
