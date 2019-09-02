"
A task that manipulates work packets.
"
Class {
	#name : #RichWorkerTaskDataRecord,
	#superclass : #RichObject,
	#instVars : [
		'destination',
		'count'
	],
	#category : 'SMark-Richards'
}

{ #category : #'instance creation' }
RichWorkerTaskDataRecord class >> create [
	^ super basicNew create
]

{ #category : #accessing }
RichWorkerTaskDataRecord >> count [
	^ count
]

{ #category : #accessing }
RichWorkerTaskDataRecord >> count: anInteger [
	count := anInteger
]

{ #category : #'instance creation' }
RichWorkerTaskDataRecord >> create [
    destination := RichObject HandlerA.
    count := 0
]

{ #category : #accessing }
RichWorkerTaskDataRecord >> destination [
	^ destination
]

{ #category : #accessing }
RichWorkerTaskDataRecord >> destination: anObject [
	destination := anObject
]
