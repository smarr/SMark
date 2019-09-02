Class {
	#name : #SomFannkuch,
	#superclass : #SomBenchmark,
	#instVars : [
		'timesRotated',
		'perm',
		'atEnd'
	],
	#classVars : [
		'results'
	],
	#category : 'SOM-Benchmarks'
}

{ #category : #'as yet unclassified' }
SomFannkuch class >> expectedResult: problemSize [
      results isNil ifTrue: [
        results := Array new: 12.
        results at:  1 put:  0.
        results at:  2 put:  1.
        results at:  3 put:  2.
        results at:  4 put:  4.
        results at:  5 put:  7.
        results at:  6 put: 10.
        results at:  7 put: 16.
        results at:  8 put: 22.
        results at:  9 put: 30.
        results at: 10 put: 38.
        results at: 11 put: 51.
        results at: 12 put: 65.
      ].
      ^ results at: problemSize
]

{ #category : #accessing }
SomFannkuch >> atEnd [
        ^atEnd
]

{ #category : #benchmarking }
SomFannkuch >> benchFannkuch [
		| result |
      self initialize: self problemSize.
      result := self maxPfannkuchen.
      ^ result = (SomFannkuch expectedResult: self problemSize)
]

{ #category : #initialization }
SomFannkuch >> initialize: size [
	perm := Array new: size.
	1 to: size do: [:i | perm at: i put: i ].
	timesRotated := Array new: size withAll: 0.
	atEnd := false
]

{ #category : #benchmarking }
SomFannkuch >> innerBenchmarkLoop [
		| result |
      self initialize: innerIterations.
      result := self maxPfannkuchen.
      ^ result = (SomFannkuch expectedResult: innerIterations)
]

{ #category : #'initialize-release' }
SomFannkuch >> makeNext [
	| temp remainder |
	"* Generate the next permutation. *"
	2 to: perm size do: [ :r |
		"* Rotate the first r items to the left. *"
		temp := perm at: 1.
		1 to: r - 1 do: [ :i | perm at: i put: (perm at: i + 1) ].
		perm at: r put: temp.

		timesRotated at: r put: (((timesRotated at: r) + 1) % r).
		remainder := timesRotated at: r.
		remainder = 0 ifFalse: [ ^self ].

		"* After r rotations, the first r items are in their original positions.
		 Go on rotating the first r+1 items. *"
	].

	"* We are past the final permutation. *"
	atEnd := true.
]

{ #category : #benchmarking }
SomFannkuch >> maxPfannkuchen [
        | max permutation |
        max := 0.
        [self atEnd] whileFalse: [
            permutation := self next.
            max := max max: (self pfannkuchen: permutation)].
        ^max
]

{ #category : #accessing }
SomFannkuch >> next [
        | result |
        result := perm copy.
        self makeNext.
        ^result
]

{ #category : #benchmarking }
SomFannkuch >> pfannkuchen: anArray [
	| first complement a b k |
	k := 0.
	[ (first := anArray at: 1) = 1 ] whileFalse: [
		k := k + 1.
		complement := first + 1.

		1 to: first / 2 do: [ :i |
			a := anArray at: i.
			b := anArray at: complement - i.
			anArray at: i put: b.
			anArray at: complement - i put: a.
	] ].
	^ k
]
