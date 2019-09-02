Class {
	#name : #BGFannkuchRedux,
	#superclass : #Object,
	#instVars : [
		'permGenFactory'
	],
	#category : 'CL-Benchmarks-Game'
}

{ #category : #defaults }
BGFannkuchRedux class >> defaultProblemSize [
	^ 4
]

{ #category : #benchmarking }
BGFannkuchRedux class >> fannkuchRedux: n to: output [
	^ self new fannkuchRedux: n to: output
]

{ #category : #'benchmark scripts' }
BGFannkuchRedux class >> fannkuchredux [
   | n f |
   n := 4.
   f := self new fannkuchRedux: n to: (TextStream with: ByteString new).
   ScriptConsole println: 'Pfannkuchen(', n printString, ') = ', f asString.
   ^''
]

{ #category : #benchmarking }
BGFannkuchRedux >> fannkuchRedux: n to: output [
	| gen |
	gen := permGenFactory new: n.
   ^ self maxPfannkuchenTo: output with: gen.
]

{ #category : #'initialize-release' }
BGFannkuchRedux >> initialize [
	permGenFactory := BGPermGeneratorRedux.
]

{ #category : #benchmarking }
BGFannkuchRedux >> maxPfannkuchenTo: output with: gen [
   | max permutation checksum permCount flipsCount |
   max := 0.
   permCount := 0.
   checksum := 0.
   [gen atEnd] whileFalse:
      [permutation := gen next.
      permCount := permCount + 1.
      (permCount = 1048576) ifTrue: [permCount := 0].
      flipsCount := self pfannkuchen: permutation.
      checksum := permCount odd ifTrue: [checksum+flipsCount] ifFalse: [checksum-flipsCount].
      max := max max: flipsCount].
   output print: checksum; cr.
   ^ max
]

{ #category : #benchmarking }
BGFannkuchRedux >> pfannkuchen: anArray [
   | first complement a b k |
   k := 0.
   [ (first := anArray at: 1) == 1 ] whileFalse: [
      k := k + 1.
      complement := first + 1.
      1 to: first // 2 do: [ :i |
         a := anArray at: i.
         b := anArray at: complement - i.
         anArray at: i put: b.
         anArray at: complement - i put: a.
      ]
   ].
   ^ k
]
