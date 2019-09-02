Class {
	#name : #SomTowersDisk,
	#superclass : #Object,
	#instVars : [
		'size',
		'next'
	],
	#category : 'SOM-Benchmarks'
}

{ #category : #'as yet unclassified' }
SomTowersDisk class >> new: value [
	^ self basicNew size: value
]

{ #category : #'as yet unclassified' }
SomTowersDisk >> next [
	^ next
]

{ #category : #'as yet unclassified' }
SomTowersDisk >> next: value [
	next := value
]

{ #category : #'as yet unclassified' }
SomTowersDisk >> size [
	^ size
]

{ #category : #'as yet unclassified' }
SomTowersDisk >> size: value [
	size := value
]
