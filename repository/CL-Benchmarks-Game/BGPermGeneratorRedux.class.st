Class {
	#name : #BGPermGeneratorRedux,
	#superclass : #Object,
	#instVars : [
		'timesRotated',
		'perm',
		'atEnd'
	],
	#category : 'CL-Benchmarks-Game-FannkuchRedux'
}

{ #category : #'instance creation' }
BGPermGeneratorRedux class >> new: size [
   ^self new
      initialize: size;
      yourself
]

{ #category : #accessing }
BGPermGeneratorRedux >> atEnd [
   ^atEnd
]

{ #category : #'initialize-release' }
BGPermGeneratorRedux >> initialize: size [
   perm := (1 to: size) asArray.
   timesRotated := Array new: size withAll: 0.
   atEnd := false.
]

{ #category : #'initialize-release' }
BGPermGeneratorRedux >> makeNext [
   | temp remainder |
   "* Generate the next permutation. *"
   2 to: perm size do: [ :r |
      "* Rotate the first r items to the left. *"
      temp := perm at: 1.
      1 to: r - 1 do: [ :i | perm at: i put: (perm at: i + 1) ].
      perm at: r put: temp.

      remainder := timesRotated at: r put: ((timesRotated at: r) + 1) \\ r.
      remainder = 0 ifFalse: [ ^self ].

      "* After r rotations, the first r items are in their original positions.
      Go on rotating the first r+1 items. *"
   ].

   "* We are past the final permutation. *"
   atEnd := true
]

{ #category : #accessing }
BGPermGeneratorRedux >> next [
   | result |
   result := perm copy.
   self makeNext.
   ^result
]
