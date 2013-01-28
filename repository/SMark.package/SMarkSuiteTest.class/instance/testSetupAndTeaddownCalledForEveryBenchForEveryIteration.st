tests
testSetupAndTeaddownCalledForEveryBenchForEveryIteration
	| suite runner |

	"Setup needs to be executed for every benchmark on every iteration.
	 Test with iterations: 1"
	suite := SMarkTestSuite new.
	runner := SMarkTestRunner execute: suite with: 1.

	self assert: 4 equals: runner setUpCount.
	self assert: 4 equals: runner tearDownCount.
	
	"Setup needs to be executed for every benchmark on every iteration.
	 Test with iterations: 4"
	suite := SMarkTestSuite new.
	runner := SMarkTestRunner execute: suite with: 4.

	self assert: (4 * 4) equals: runner setUpCount.
	self assert: (4 * 4) equals: runner tearDownCount.
	
	"Test with iterations: 10"
	suite := SMarkTestSuite new.
	runner := SMarkTestRunner execute: suite with: 10.
	self assert: (4 * 10) equals: runner setUpCount.
	self assert: (4 * 10) equals: runner tearDownCount.