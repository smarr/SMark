"
A task that suspends itself after each time it has been run to simulate waiting for data from an external device.

"
Class {
	#name : #RichDeviceTaskDataRecord,
	#superclass : #RichObject,
	#instVars : [
		'pending'
	],
	#category : 'SMark-Richards'
}

{ #category : #'instance creation' }
RichDeviceTaskDataRecord class >> create [
	^ super basicNew create
]

{ #category : #initialization }
RichDeviceTaskDataRecord >> create [
	pending := RichObject NoWork
]

{ #category : #accessing }
RichDeviceTaskDataRecord >> pending [
	^ pending
]

{ #category : #accessing }
RichDeviceTaskDataRecord >> pending: packet [
	pending := packet
]
