Class {
	#name : #GSEdge,
	#superclass : #Object,
	#instVars : [
		'dest',
		'weight'
	],
	#category : 'SOM-Benchmarks-GraphSearch'
}

{ #category : #'instance creation' }
GSEdge class >> newWith: dest and: weight [
	^ self basicNew initializeWith: dest and: weight
]

{ #category : #accessing }
GSEdge >> dest [
	^ dest
]

{ #category : #initialization }
GSEdge >> initializeWith: destination and: w [
	dest   := destination.
	weight := w.
]

{ #category : #accessing }
GSEdge >> weight [
	^ weight
]
