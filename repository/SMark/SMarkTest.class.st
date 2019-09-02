"
A general test to ensure the overall framework works as expected.
"
Class {
	#name : #SMarkTest,
	#superclass : #TestCase,
	#category : 'SMark-Tests'
}

{ #category : #running }
SMarkTest >> setUp [
	"Necessary for Squeak 4.2 compatibility, since method anotations are not supported in the base image."
	(self respondsTo:  #timeout:) ifTrue: [
		self timeout: 300.
	].
]

{ #category : #tests }
SMarkTest >> testAllBenchmarksForReturningThemSelf [
	"This is a regression test to ensure that the old behavior worked in the first place"
	| allSuites |
	allSuites := { SMarkCompiler. SMarkLoops }.
	
	allSuites do: [:suite |
		suite isAbstractClass ifFalse: [
			| runner results |
			Transcript show: (suite class name asString); cr.
			runner := suite run.
			results := runner results.
			self assert: (runner isKindOf: suite defaultRunner).
			self assert: 1 equals: runner iterations.
			self assert: (results size > 0).
		].
	].
]

{ #category : #tests }
SMarkTest >> testBasicRun [
	| runner results benchResult result |
	
	runner := SMarkLoops run.
	results := runner results.
	result := (results at: #IntLoop).
	
	self assert: (result isKindOf: Collection).
	self assert: result size equals: 1.
	
	benchResult := result at: 1.
	self assert: (benchResult isKindOf: SMarkResult).
	self assert: (benchResult total notNil).
	
]
