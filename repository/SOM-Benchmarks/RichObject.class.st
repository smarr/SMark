"
This class mostly adds some constants that are used in the Richards benchmarks.
"
Class {
	#name : #RichObject,
	#superclass : #Object,
	#classVars : [
		'DeviceA',
		'DeviceB',
		'DevicePacketKind',
		'HandlerA',
		'HandlerB',
		'Idler',
		'NoTask',
		'NoWork',
		'WorkPacketKind',
		'Worker'
	],
	#category : 'SOM-Benchmarks-Richards'
}

{ #category : #'as yet unclassified' }
RichObject class >> DeviceA [
	^ DeviceA
]

{ #category : #'as yet unclassified' }
RichObject class >> DeviceB [
	^ DeviceB
]

{ #category : #'as yet unclassified' }
RichObject class >> DevicePacketKind [
	^ DevicePacketKind
]

{ #category : #'as yet unclassified' }
RichObject class >> HandlerA [
	^ HandlerA
]

{ #category : #'as yet unclassified' }
RichObject class >> HandlerB [
	^ HandlerB
]

{ #category : #'as yet unclassified' }
RichObject class >> Idler [
	^ Idler
]

{ #category : #'as yet unclassified' }
RichObject class >> NoTask [
	^ NoTask
]

{ #category : #'as yet unclassified' }
RichObject class >> NoWork [
	^ NoWork
]

{ #category : #'as yet unclassified' }
RichObject class >> WorkPacketKind [
	^ WorkPacketKind
]

{ #category : #'as yet unclassified' }
RichObject class >> Worker [
	^ Worker
]

{ #category : #initialize }
RichObject class >> initialize [
    	DeviceA := 5.
    	DeviceB := 6.
    	DevicePacketKind := 1.
    	HandlerA := 3.
    	HandlerB := 4.
    	Idler := 1.
	   NoWork := nil.
	   NoTask := nil.
    	Worker := 2.
    	WorkPacketKind := 2
]

{ #category : #utilities }
RichObject >> append: packet head: queueHead [
    | mouse link |
    packet link: RichObject NoWork.
    RichObject NoWork == queueHead ifTrue: [ ^ packet ].
    mouse := queueHead.
    [RichObject NoWork == (link := mouse link)]
        whileFalse: [ mouse := link ].
    mouse link: packet.
    ^ queueHead
]
