running
setUp
	| runner |
	runner := SMarkTestRunner execute: SMarkTestRunnerSuite new.
	result := (runner results at: #DoNothing) at: 1.