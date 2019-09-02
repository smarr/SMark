Class {
	#name : #SMarkCompilerTarget,
	#superclass : #Object,
	#instVars : [
		'target',
		'classFactory'
	],
	#category : 'SMark-Classic'
}

{ #category : #'accessing method dictionary' }
SMarkCompilerTarget class >> acceptsLoggingOfCompilation [
	^ self == SMarkCompilerTarget
]

{ #category : #'accessing method dictionary' }
SMarkCompilerTarget class >> addAndClassifySelector: aSelector withMethod: aCompiledMethod inProtocol: aCategory [
	self == SMarkCompilerTarget ifTrue: [
		^ super
				addAndClassifySelector: aSelector
				withMethod: aCompiledMethod
				inProtocol: aCategory ].
	self
		addSelectorSilently: aSelector
		withMethod: aCompiledMethod
]

{ #category : #accessing }
SMarkCompilerTarget >> classFactory [
	^ classFactory ifNil: [ classFactory := ClassFactoryForTestCase new ]
]

{ #category : #compiling }
SMarkCompilerTarget >> compile: aString [
	target := self classFactory
		newSubclassOf: self class
		using: #().
	target compile: aString
]

{ #category : #running }
SMarkCompilerTarget >> target [
	^ target
]

{ #category : #running }
SMarkCompilerTarget >> tearDown [
	target := nil.
	self classFactory cleanUp
]
