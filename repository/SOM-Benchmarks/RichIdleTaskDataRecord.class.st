"
An idle task doesn't do any work itself but cycles control between the two device tasks.
"
Class {
	#name : #RichIdleTaskDataRecord,
	#superclass : #RichObject,
	#instVars : [
		'control',
		'count'
	],
	#category : 'SOM-Benchmarks-Richards'
}

{ #category : #'instance creation' }
RichIdleTaskDataRecord class >> create [
	^ super basicNew create
]

{ #category : #accessing }
RichIdleTaskDataRecord >> control [
	^ control
]

{ #category : #accessing }
RichIdleTaskDataRecord >> control: aNumber [
	control := aNumber
]

{ #category : #accessing }
RichIdleTaskDataRecord >> count [
	^ count
]

{ #category : #accessing }
RichIdleTaskDataRecord >> count: aCount [
	count := aCount
]

{ #category : #initialize }
RichIdleTaskDataRecord >> create [
    control := 1.
    count := 10000
]
