Class {
	#name : #SomJenkinsRandom,
	#superclass : #Object,
	#classVars : [
		'seed'
	],
	#category : 'SOM-Benchmarks'
}

{ #category : #converting }
SomJenkinsRandom class >> as32BitSigned: val [
	| r |
	r := val bitAnd: 16rffffffff.
	(r bitAnd: 16r80000000) = 0 ifTrue: [ ^ r ].
	^ (16r100000000 - r) * -1
	
]

{ #category : #accessing }
SomJenkinsRandom class >> random [
	"Robert Jenkins' 32 bit integer hash function."
	 seed := ((seed       + 16r7ed55d16)       + (seed << 12)).
    seed := ((seed bitXor: 16rc761c23c) bitXor: ((seed bitAnd: 16rffffffff) >> 19)).
    seed := ((seed       + 16r165667B1)       + (seed <<  5)).
    seed := ((seed       + 16rd3a2646c) bitXor: (seed <<  9)).
    seed := ((seed       + 16rfd7046c5)       + (seed <<  3)).
    seed := self as32BitSigned: ((seed bitXor: 16rb55a4f09) bitXor: ((seed bitAnd: 16rffffffff) >> 16)).
    ^ seed
]

{ #category : #accessing }
SomJenkinsRandom class >> randomFirst [
	"Robert Jenkins' 32 bit integer hash function."
	 seed := self as32BitSigned: ((seed       + 16r7ed55d16)       + (self as32BitSigned: ((seed bitAnd: 16rffffffff) << 12))).
    seed := self as32BitSigned: ((seed bitXor: 16rc761c23c) bitXor: ((seed bitAnd: 16rffffffff) >> 19)).
    seed := self as32BitSigned: ((seed       + 16r165667B1)       + (self as32BitSigned: ((seed bitAnd: 16rffffffff) <<  5))).
    seed := self as32BitSigned: ((seed       + 16rd3a2646c) bitXor: (self as32BitSigned: ((seed bitAnd: 16rffffffff) <<  9))).
    seed := self as32BitSigned: ((seed       + 16rfd7046c5)       + (self as32BitSigned: ((seed bitAnd: 16rffffffff) <<  3))).
    seed := self as32BitSigned: ((seed bitXor: 16rb55a4f09) bitXor: ((seed bitAnd: 16rffffffff) >> 16)).
    ^ seed
]

{ #category : #accessing }
SomJenkinsRandom class >> randomOpt [
	"Robert Jenkins' 32 bit integer hash function."
	 seed := self as32BitSigned: ((seed       + 16r7ed55d16)       + (seed << 12)).
    seed :=                     ((seed bitXor: 16rc761c23c) bitXor: (seed >> 19)).
    seed :=                     ((seed       + 16r165667B1)       + (seed <<  5)).
    seed :=                     ((seed       + 16rd3a2646c) bitXor: (seed <<  9)).
    seed := self as32BitSigned: ((seed       + 16rfd7046c5)       + (seed <<  3)).
    seed := self as32BitSigned: ((seed bitXor: 16rb55a4f09) bitXor: (seed >> 16)).
    ^ seed
]

{ #category : #accessing }
SomJenkinsRandom class >> seed: val [
	seed := val
]
