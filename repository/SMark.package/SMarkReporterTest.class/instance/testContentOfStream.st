tests
testContentOfStream
	"Hm, how to test that robustly?"
	| reporter stream out |
	stream := TextStream on: String new.
	reporter := SMarkReporter reportFor: runner on: stream.
	
	out := stream contents.
	
	self assert: (out includesSubString: 'Small').
	self assert: (out includesSubString: 'Big').
	self assert: (out includesSubString: 'Small').