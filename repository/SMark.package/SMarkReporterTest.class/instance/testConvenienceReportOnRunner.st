tests
testConvenienceReportOnRunner
	| stream out |
	stream := TextStream on: String new.
	
	"That should just work, cannot really check whether it is displayed anywhere."
	SMarkTestRunnerSuiteForAutosizing run report.
	
	"Check whether it reported as expected"
	SMarkTestRunnerSuiteForAutosizing run reportOn: stream.
	
	out := stream contents.
	
	self assert: (self string: out includes: 'Small').
	self assert: (self string: out includes: 'Big').