Class {
	#name : #BGPiDigits,
	#superclass : #Object,
	#instVars : [
		'spigotFactory',
		'arrayFactory'
	],
	#category : 'CL-Benchmarks-Game'
}

{ #category : #defaults }
BGPiDigits class >> defaultProblemSize [
	^ 27
]

{ #category : #benchmarking }
BGPiDigits class >> piDigits: n [
	^ self new piDigitsTo: n
]

{ #category : #'initialize-release' }
BGPiDigits >> initialize [
	spigotFactory := BGPiDigitSpigot.
	arrayFactory  := Array.
]

{ #category : #benchmarking }
BGPiDigits >> piDigitsTo: n [
   ^ self piDigitsTo: n with: spigotFactory new.
 
]

{ #category : #benchmarking }
BGPiDigits >> piDigitsTo: n with: piDigits [
   | i array |
   array := arrayFactory new: n.
   i := 1.
   
   [i <= n] whileTrue:
      [ array at: i put: piDigits next.
	     i := i + 1 ].
	^ array
]
