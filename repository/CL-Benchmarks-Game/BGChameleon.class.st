Class {
	#name : #BGChameleon,
	#superclass : #Object,
	#instVars : [
		'meetings',
		'color',
		'semaphore',
		'waitingForPair'
	],
	#category : 'CL-Benchmarks-Game-Chameleons'
}

{ #category : #'instance creation' }
BGChameleon class >> color: c [
    ^self new
        initialize;
        color: c
]

{ #category : #accessing }
BGChameleon >> color [
    ^color
]

{ #category : #'changing colours' }
BGChameleon >> color: c [
    color := c
]

{ #category : #'changing colours' }
BGChameleon >> fade [
    color := #faded.
    waitingForPair signal.
    semaphore signal
]

{ #category : #running }
BGChameleon >> fork: meetingPlace [
    ^[ self run: meetingPlace ] fork
]

{ #category : #'initialize-release' }
BGChameleon >> initialize [
    meetings := 0.
    waitingForPair := Semaphore new.
    semaphore := Semaphore new
]

{ #category : #accessing }
BGChameleon >> meetings [
    ^meetings
]

{ #category : #'changing colours' }
BGChameleon >> met: other [
    | newColor |
    meetings := meetings + 1.
    color == #red ifTrue: [
    newColor := other == #yellow ifTrue: [ #blue ] ifFalse: [ #yellow ] ].
    color == #yellow ifTrue: [
    newColor := other == #red ifTrue: [ #blue ] ifFalse: [ #red ] ].
    color == #blue ifTrue: [
    newColor := other == #red ifTrue: [ #yellow ] ifFalse: [ #red ] ].
    color := newColor.
    waitingForPair signal
]

{ #category : #running }
BGChameleon >> run: meetingPlace [
    [ color == #faded ] whileFalse: [
        meetingPlace reachedBy: self.
        waitingForPair wait ]
]

{ #category : #accessing }
BGChameleon >> wait [
    | timeout |
	timeout := semaphore waitTimeoutSeconds: 2.
	timeout ifTrue: [Halt now].

]
