Class {
	#name : #SMarkReporterTest,
	#superclass : #TestCase,
	#instVars : [
		'runner'
	],
	#category : 'SMark-Tests'
}

{ #category : #running }
SMarkReporterTest >> setUp [
	runner := SMarkTestRunnerSuiteForAutosizing run.
]

{ #category : #'compatibility Pharo 1.4 vs. 2.0' }
SMarkReporterTest >> string: str includes: subStr [
	"To be compatible with Pharo 1.4 and 2.0"
	(str respondsTo: #includesSubstring:)
		ifTrue:  [ ^ str includesSubstring: subStr ] "2.0"
		ifFalse: [ ^ str includesSubString: subStr ] "1.4"
]

{ #category : #tests }
SMarkReporterTest >> testContentOfStream [
	"Hm, how to test that robustly?"
	| reporter stream out |
	stream := TextStream on: String new.
	reporter := SMarkReporter reportFor: runner on: stream.
	
	out := stream contents.
	
	self assert: (self string: out includes: 'Small').
	self assert: (self string: out includes: 'Big').
]

{ #category : #tests }
SMarkReporterTest >> testConvenienceReportOnRunner [
	| stream out |
	stream := TextStream on: String new.
	
	"That should just work, cannot really check whether it is displayed anywhere."
	SMarkTestRunnerSuiteForAutosizing run report.
	
	"Check whether it reported as expected"
	SMarkTestRunnerSuiteForAutosizing run reportOn: stream.
	
	out := stream contents.
	
	self assert: (self string: out includes: 'Small').
	self assert: (self string: out includes: 'Big').
]
