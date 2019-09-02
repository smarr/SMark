"
Some of the Benchmark Game benchmarks use the output of the Fasta benchmark as input.
This class will act as a cache for these to avoid recomputation.
"
Class {
	#name : #BGFastaCache,
	#superclass : #Object,
	#instVars : [
		'cache'
	],
	#classVars : [
		'Cache'
	],
	#category : 'CL-Benchmarks-Game'
}

{ #category : #accessing }
BGFastaCache class >> forFasta: anInteger [
	<omniUnenforced>
	Cache ifNil: [Cache := self new].
	^ Cache forFasta: anInteger
]

{ #category : #accessing }
BGFastaCache class >> primeForFasta: anInteger [
	<omniUnenforced>
	Cache ifNil: [Cache := self new].
	^ Cache primeForFasta: anInteger
]

{ #category : #cache }
BGFastaCache >> forFasta: anInteger [
	" This will throw an error if the cache is not initialized properly."
    ^ cache at: anInteger ifAbsentPut: [Error signal: 'Cache not properly initialized for given problem size: ', anInteger asString, '.'].
]

{ #category : #'initialize-release' }
BGFastaCache >> initialize [
	cache := Dictionary new.
]

{ #category : #cache }
BGFastaCache >> primeForFasta: anInteger [
	| out result |
   out := TextStream with: ByteString new.
   BGFasta fasta: anInteger to: out.
   
	result := out contents.
	cache at: anInteger put: result.
	^ result
]
