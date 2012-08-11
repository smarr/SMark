running
runCase: aTestCase
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
