Class {
	#name : #NPBTest,
	#superclass : #TestCase,
	#category : 'NPB-Tests'
}

{ #category : #running }
NPBTest >> setUp [
	"Necessary for Squeak 4.2 compatibility, since method anotations are not supported in the base image."
	(self respondsTo:  #timeout:) ifTrue: [
		self timeout: 300.
	].
]

{ #category : #tests }
NPBTest >> testIS [
	| verified runner suite |
	runner := SMarkRunner new.
	suite  := NPBSuite new.
	suite runner: runner.
	runner suite: suite.
	runner iterations: 1.
	runner processes: 1.
	runner problemSize: #S.
	
	self flag: 'TODO: fix implementation for multiple processes on pharo!'.
	
	self shouldnt: [	runner execute. 
				"TODO: update as soon as the SMark framework supports verification"
				verified := false. ]
		 raise: Error.
	self flag: 'TODO: add verification'.
	"self assert: verified."
]

{ #category : #tests }
NPBTest >> testKeyArrayContent [
	| o keyArray |
	o := NPBIS newOfSizeClass: #S with: 0 serial: true.
	o initKeys: NPBIS amult.
	
	keyArray := o keyArray.
	
	self assert: (keyArray at: 65536) equals: 962.
	self assert:	(keyArray at: 65535) equals: 677.
	self assert: (keyArray at: 30001) equals: 557.
	self assert: (keyArray at: 1) equals: 1585.
	self assert: (keyArray at: 2) equals: 825.
	self assert: (keyArray at: 12) equals: 1140.

]
