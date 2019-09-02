Class {
	#name : #GSNode,
	#superclass : #Object,
	#instVars : [
		'starting',
		'noOfEdges'
	],
	#category : 'SMark-SOM-GraphSearch'
}

{ #category : #'instance creation' }
GSNode class >> newWith: starting and: noOfEdges [
	^ self basicNew initializeWith: starting and: noOfEdges
]

{ #category : #initialization }
GSNode >> initializeWith: start and: edges [
	starting := start.
	noOfEdges:= edges
]

{ #category : #accessing }
GSNode >> noOfEdges [
	^ noOfEdges
]

{ #category : #accessing }
GSNode >> starting [
	^ starting
]
