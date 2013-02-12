tests
testContentOfStream
	"Hm, how to test that robustly?"
	| reporter stream out |
	stream := TextStream on: String new.
	reporter := SMarkReporter reportFor: runner on: stream.
	
	out := stream contents.
	
	self assert: (self string: out includes: 'Small').
	self assert: (self string: out includes: 'Big').