as yet unclassified
testTimer
	"Simple test whether a timer is created and it is from the expected class.
	 This test is very basic, other tests like testBenchmarkWithMultipleCirteria* need to cover the rest"
	| runner timer |
	runner := self runnerClass new.
	timer := runner createTimer: #foo.

	self assert: timer name equals: #foo.
	self assert: (timer isKindOf: self runnerClass defaultTimer).  