Class {
	#name : #SubunitTestExamples,
	#superclass : #TestCase,
	#category : 'Scripting-Tests'
}

{ #category : #'as yet unclassified' }
SubunitTestExamples >> expectedFailures [
	^#(testExpectedFail testUnexpectedPass)
]

{ #category : #'as yet unclassified' }
SubunitTestExamples >> testAllFine [
	self assert: true.
]

{ #category : #'as yet unclassified' }
SubunitTestExamples >> testException [
	self foobarNotUnderstood.
]

{ #category : #'as yet unclassified' }
SubunitTestExamples >> testExpectedFail [
	self fail.
]

{ #category : #'as yet unclassified' }
SubunitTestExamples >> testFail [
	self fail.
]

{ #category : #'as yet unclassified' }
SubunitTestExamples >> testUnexpectedPass [
	self assert: true.
]
