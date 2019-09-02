Class {
	#name : #SubunitRunner,
	#superclass : #TestResult,
	#instVars : [
		'suite',
		'suitePosition',
		'suiteTime',
		'suiteFailures',
		'suiteErrors',
		'stream'
	],
	#classVars : [
		'DefaultOutputTarget'
	],
	#category : 'Scripting'
}

{ #category : #defaults }
SubunitRunner class >> defaultOutputTarget [
	^ DefaultOutputTarget ifNil: [
		(Smalltalk hasClassNamed: #ScriptConsole) ifTrue: [^Smalltalk classNamed: #ScriptConsole].
		Transcript
		] ifNotNil: [DefaultOutputTarget]
]

{ #category : #defaults }
SubunitRunner class >> defaultOutputTarget: someStreamishThing [
	"The output target should understand some parts of the standard stream protocol.
	 For details, see the actual usage. A Transcript is good, and most streams, too."
	DefaultOutputTarget := someStreamishThing
]

{ #category : #scripting }
SubunitRunner class >> run: arguments [
	"This is the main entry when started as a script from the command line"
	| sel  |
	(arguments size < 2) ifTrue: [
		^ self usage.].

	sel := (arguments at: 2) asSymbol.
	sel = #runAllTests ifTrue: [
		^ self runAllTests.].
	
	(arguments size < 3) ifTrue: [
		^ self usage.].
	
	self perform: sel with: (arguments at: 3).
	
]

{ #category : #running }
SubunitRunner class >> runAllTests [
	self runClasses: Smalltalk allClasses named: 'All'.
]

{ #category : #running }
SubunitRunner class >> runCategories: aCollectionOfStrings [
	^ aCollectionOfStrings do: [ :each | self runCategory: each ]
]

{ #category : #running }
SubunitRunner class >> runCategory: aString [
	^ self runClasses: (Smalltalk organization classesInCategory: aString) named: aString
]

{ #category : #running }
SubunitRunner class >> runClasses: aCollectionOfClasses named: aString [
	| suite classes |
	suite := TestSuite named: aString.
	classes := (aCollectionOfClasses
		select: [ :each | (each includesBehavior: TestCase) and: [ each isAbstract not ] ])
			asSortedCollection: [ :a :b | a name <= b name ].
	classes isEmpty
		ifTrue: [ ^ self ].
	classes
		do: [ :each | each addToSuiteFromSelectors: suite ].
	^ self runSuite: suite
]

{ #category : #running }
SubunitRunner class >> runPackage: aString [
	^ self runClasses: (PackageInfo named: aString) classes named: aString
]

{ #category : #running }
SubunitRunner class >> runPackages: aCollectionOfStrings [
	^ aCollectionOfStrings do: [ :each | self runPackage: each ]
]

{ #category : #running }
SubunitRunner class >> runSuite: aTestSuite [
	^ self new 
		initializeOn: aTestSuite; 
		run
]

{ #category : #scripting }
SubunitRunner class >> usage [
	ScriptConsole println: 'TestConsoleRunner <action> [argument]'.
	ScriptConsole println: ''.
	
	ScriptConsole println: '   <action> = runAllTests | runCategory: | runPackage: '.
]

{ #category : #reporting }
SubunitRunner >> beforeTestCase: aTestCase [
	stream nextPut: Character lf.
	
	stream	nextPutAll: 'test: '.
	self   reportTestName: aTestCase.
	stream nextPut: Character lf.
	stream flush.
]

{ #category : #reporting }
SubunitRunner >> beforeTestSuite: aSuite [
	stream nextPut: Character lf.
	
	stream nextPutAll: 'suite: ';    nextPutAll: aSuite name; nextPut: Character lf.
	stream nextPutAll: 'progress: '; nextPutAll: aSuite tests size asString; nextPut: Character lf.
	stream nextPutAll: 'time: '; nextPutAll: DateAndTime now asString; nextPut: Character lf.
	
	stream flush.

]

{ #category : #reporting }
SubunitRunner >> errorTestCase: aTestCase with: error stack: stack [
	stream nextPut: Character lf.
	
	stream nextPutAll: 'error: '.
	self   reportTestName: aTestCase.
	self   reportCause: error stack: stack.
	stream flush.
]

{ #category : #reporting }
SubunitRunner >> expectedFailTestCase: aTestCase [
	stream nextPut: Character lf.
	
	stream nextPutAll: 'xfail: '.
	self   reportTestName: aTestCase.
	stream nextPut:    Character lf.
	stream flush.
]

{ #category : #reporting }
SubunitRunner >> failedTestCase: aTestCase with: error stack: stack [
	stream nextPut: Character lf.

	stream nextPutAll: 'failure: '.
	self   reportTestName: aTestCase.
	self   reportCause: error stack: stack.
	stream flush.
]

{ #category : #initialization }
SubunitRunner >> initialize [
	super initialize.
	stream := self class defaultOutputTarget
]

{ #category : #initialization }
SubunitRunner >> initializeOn: aTestSuite [
	suite := aTestSuite.
	suitePosition := suiteTime := suiteFailures := suiteErrors := 0
]

{ #category : #reporting }
SubunitRunner >> reportCause: error stack: stack [
	stream nextPutAll: ' ['; nextPut: Character lf.
	stream
		tab; nextPutAll: 'type: '; nextPutAll: (error class name); nextPut: Character lf;
		tab; nextPutAll: 'message:'; nextPutAll: (error messageText ifNil: [ error description ]); nextPut: Character lf;
		tab; nextPutAll: 'stack trace:'; nextPut: Character lf;
		nextPutAll: stack;
		nextPut: Character lf;
		nextPutAll: ']'; nextPut: Character lf
]

{ #category : #reporting }
SubunitRunner >> reportTestName: aTestCase [
  stream
	nextPutAll: (aTestCase class category); nextPut: $.;
	nextPutAll: (aTestCase class name); nextPut: $.;
	nextPutAll: (aTestCase selector)
]

{ #category : #running }
SubunitRunner >> run [
	| execBlock |
	execBlock :=  [ [ 
			self setUp.
			suiteTime := [ self runAll ]
				timeToRun ]
					ensure: [ self tearDown. ] ].
	
	(Smalltalk at: #Author ifAbsent: [ 
		execBlock value.
		^ self ])
			uniqueInstance
				ifUnknownAuthorUse: 'TestConsoleRunner'
				during: execBlock.
]

{ #category : #running }
SubunitRunner >> runAll [
	suite tests do: [ :each | each run: self ]
]

{ #category : #running }
SubunitRunner >> runCase: aTestCase [
	| error stack didSucceed |
	didSucceed := false.
	
	self beforeTestCase: aTestCase.
	
	[	aTestCase announce: TestCaseStarted withResult: self.
		aTestCase runCase.
		aTestCase announce: TestCaseEnded  withResult: self.
		self addPass: aTestCase.
		didSucceed := true.] 
	on: Halt , Error, TestFailure, self class failure, self class error
	do: [ :err |
			error := err.
			stack := self stackTraceString: err of: aTestCase.
			err sunitAnnounce: aTestCase toResult: self ].

	didSucceed ifTrue: [
		self successfulTestCase: aTestCase.
		^ self.].
	
	(error isNil or: [ aTestCase expectedFailures includes: aTestCase selector ]) ifTrue: [
		self expectedFailTestCase: aTestCase.
		^ self.
	].


	(error isKindOf: TestFailure)
		ifTrue: [self failedTestCase: aTestCase with: error stack: stack]
		ifFalse:[self errorTestCase:  aTestCase with: error stack: stack].

]

{ #category : #running }
SubunitRunner >> setUp [
	self beforeTestSuite: suite.
	
	"Initialize the test resources."
	suite resources do: [ :each |
		each isAvailable
			ifFalse: [ each signalInitializationError ] ]
]

{ #category : #private }
SubunitRunner >> stackTraceString: err of: aTestCase [
	^ String streamContents: [ :str | 
		| context |
		context := err signalerContext.
		[ context isNil or: [ context receiver == aTestCase and: [ context methodSelector == #runCase ] ] ] whileFalse: [
			str print: context; nextPut: Character lf.
			context := context sender ] ] 
]

{ #category : #reporting }
SubunitRunner >> successfulTestCase: aTestCase [
	stream nextPut: Character lf.
	
	stream 
	  nextPutAll: 'success: ';
	  nextPutAll: (aTestCase class category); nextPut: $.;
	  nextPutAll: (aTestCase class name); nextPut: $.;
	  nextPutAll: (aTestCase selector);
	  nextPut:    Character lf.
	  stream flush.
]

{ #category : #running }
SubunitRunner >> tearDown [
	suite resources 
		do: [ :each | each reset ]
]
