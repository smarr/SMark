Class {
	#name : #BGRandomStream,
	#superclass : #BGRepeatStream,
	#instVars : [
		'random',
		'percentages',
		'randomNumFactory',
		'arrayFactory'
	],
	#category : 'CL-Benchmarks-Game-Fasta'
}

{ #category : #'initialize-release' }
BGRandomStream >> initialize [
	randomNumFactory := BGRandomNumber.
	arrayFactory     := Array.
]

{ #category : #accessing }
BGRandomStream >> next [
   | r |
   r := random next.
   repeatPtr := repeatPtr + 1.
   1 to: percentages size do: [:i|
      (r < (percentages at: i)) ifTrue: [^collection at: i]]
]

{ #category : #'initialize-release' }
BGRandomStream >> on: aCollection [
   | size cp |
	self initialize.
	
   repeatPtr := 0.
   random := randomNumFactory to: 1.0d0.
   size := aCollection size.
   percentages := arrayFactory new: size.
   collection  := arrayFactory new: size.
   cp := 0.0d0.
   1 to: size do: [:i|
      collection  at: i put: (aCollection at: i) first.
      percentages at: i put: (cp := cp + (aCollection at: i) last).
   ]
]

{ #category : #accessing }
BGRandomStream >> random: aRandomNumber [
"* Share the random number generator so we can get the expected results. *"
   random := aRandomNumber
]
