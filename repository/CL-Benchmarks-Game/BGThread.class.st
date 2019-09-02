"
A BGThread is xxxxxxxxx.

* The Computer Language Benchmarks Game
    http://benchmarksgame.alioth.debian.org/
    adapted from a program by Paolo Bonzini
    contributed by Isaac Gouy 
    modified by Carlo Teixeira.
    Ported to Pharo/Squeak by Stefan Marr *

Instance Variables
	done:		<Object>
	name:		<Object>
	nextThread:		<Object>
	semaphore:		<Object>
	token:		<Object>

done
	- xxxxx

name
	- xxxxx

nextThread
	- xxxxx

semaphore
	- xxxxx

token
	- xxxxx

"
Class {
	#name : #BGThread,
	#superclass : #Object,
	#instVars : [
		'name',
		'nextThread',
		'token',
		'semaphore',
		'done'
	],
	#category : 'CL-Benchmarks-Game-ThreadRing'
}

{ #category : #'instance creation' }
BGThread class >> named: anInteger next: aThread done: completionBlock [
   ^ self new 
			name: anInteger;
			nextThread: aThread;
			done: completionBlock;
			fork
]

{ #category : #'instance creation' }
BGThread class >> new [
   ^ self basicNew
			semaphore: Semaphore new
]

{ #category : #accessing }
BGThread >> done: completionBlock [
	done := completionBlock
]

{ #category : #thread }
BGThread >> fork [
   [ self run ] forkAt: Processor userBackgroundPriority
]

{ #category : #accessing }
BGThread >> name: anInteger [
   name := anInteger
]

{ #category : #accessing }
BGThread >> nextThread: aThread [
   nextThread := aThread
]

{ #category : #thread }
BGThread >> run [
   [ semaphore wait.
     token < 503 ] whileFalse: [
								nextThread takeToken: token - 1].
	
	token == 0 ifFalse: [ nextThread takeToken: token - 1 ]
					 ifTrue:  [ done value: name ]
					 
	
   
]

{ #category : #accessing }
BGThread >> semaphore: aSemaphore [
   semaphore := aSemaphore
]

{ #category : #accessing }
BGThread >> takeToken: x [
   token := x.
   semaphore signal
]
