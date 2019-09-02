Class {
	#name : #BGPair,
	#superclass : #Object,
	#instVars : [
		'partner',
		'me',
		'sema'
	],
	#category : 'CL-Benchmarks-Game-ChameneosRedux'
}

{ #category : #'instance creation' }
BGPair class >> new [
   "Answer a newly created and initialized instance."
   ^super new initialize.
]

{ #category : #'instance creation' }
BGPair class >> with: me [ 
   "Answer a newly created and initialized instance."
self halt.
   ^super new initialize me: me
]

{ #category : #'initialize-release' }
BGPair >> initialize [
   "Initialize a newly created instance. This method must answer the receiver."

   partner := nil.
   me := nil.
   sema := Semaphore new.
   ^self
]

{ #category : #accessing }
BGPair >> me [
   ^me
]

{ #category : #accessing }
BGPair >> me: anObject [
   me := anObject
]

{ #category : #accessing }
BGPair >> partner [
   ^partner
]

{ #category : #accessing }
BGPair >> partner: anObject [
   partner := anObject
]

{ #category : #'initialize-release' }
BGPair >> release [
partner:=nil.
]

{ #category : #'initialize-release' }
BGPair >> signal [
   sema signal
]

{ #category : #'initialize-release' }
BGPair >> wait [
   sema wait
]
