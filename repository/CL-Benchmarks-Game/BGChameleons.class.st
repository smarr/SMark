Class {
	#name : #BGChameleons,
	#superclass : #Object,
	#instVars : [
		'chameleonFactory',
		'meetingPlaceFactory'
	],
	#category : 'CL-Benchmarks-Game'
}

{ #category : #'benchmark scripts' }
BGChameleons class >> chameneos [
	" reports back the number of meetings "
	^ self chameneos: 1000000
]

{ #category : #benchmarking }
BGChameleons class >> chameneos: n [
    ^ self new chameneos: n
]

{ #category : #defaults }
BGChameleons class >> defaultProblemSize [
	^ 10000
]

{ #category : #benchmarking }
BGChameleons >> chameneos: n [
    | c1 c2 c3 c4 mp |
    c1 := chameleonFactory color: #blue.
    c2 := chameleonFactory color: #red.
    c3 := chameleonFactory color: #yellow.
    c4 := chameleonFactory color: #blue.
    mp := meetingPlaceFactory forMeetings: n.
    c1 fork: mp.
    c2 fork: mp.
    c3 fork: mp.
    c4 fork: mp.
    c1 wait.
    c2 wait.
    c3 wait.
    c4 wait.
    ^ c1 meetings + c2 meetings + c3 meetings + c4 meetings
]

{ #category : #'initialize-release' }
BGChameleons >> initialize [
	super initialize.
	chameleonFactory := BGChameleon.
	meetingPlaceFactory := BGMeetingPlace.
]
