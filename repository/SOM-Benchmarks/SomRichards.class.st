"
Richards is an OS kernel simulation benchmark, originally written in BCPL by Martin Richards. The main focus in Richards is on property access and calling functions and methods.
"
Class {
	#name : #SomRichards,
	#superclass : #SomBenchmark,
	#category : 'SOM-Benchmarks-Richards'
}

{ #category : #benchs }
SomRichards >> benchmark [

	RichObject initialize.
	^ RichRunner start
]

{ #category : #benchs }
SomRichards >> verifyResult: result [
	^ result
]
