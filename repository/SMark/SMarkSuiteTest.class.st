Class {
	#name : #SMarkSuiteTest,
	#superclass : #TestCase,
	#instVars : [
		'didSetUpBenchB',
		'didTearDownBenchC'
	],
	#category : 'SMark-Tests'
}

{ #category : #tests }
SMarkSuiteTest >> testBenchmarkNameForSelector [
	| suite |
	suite := SMarkSuite new.
	
	self assert: (suite benchmarkNameForSelector: #benchSomething) equals: #Something.
	self assert: (suite benchmarkNameForSelector: #benchsomeThingElse) equals: #someThingElse.
	
	self assert: (suite benchmarkNameForSelector: #nobenchSomeThing) equals: #nobenchSomeThing.
	self assert: (suite benchmarkNameForSelector: #BenchSomeThing) equals: #BenchSomeThing.
]

{ #category : #tests }
SMarkSuiteTest >> testClassRun [
	| runner |
	
	runner := SMarkTestSuite run.
	self assert: (runner isKindOf: SMarkTestSuite defaultRunner).
	self deny: runner results isNil    
]

{ #category : #tests }
SMarkSuiteTest >> testCleanUpInstanceVariables [
	| suite |
	suite := SMarkTestSuite new.
	suite runner: #dummy.
	
	self assert: suite runner	equals: #dummy.
	self assert: suite a			equals: 1.
	self assert: suite c			equals: #three.
				
	suite cleanUpInstanceVariables.
	
	self assert: suite runner	equals: #dummy.
	self assert: suite a			equals: nil.
	self assert: suite b			equals: nil.
	self assert: suite c			equals: nil.
	self assert: suite d			equals: nil.

]

{ #category : #tests }
SMarkSuiteTest >> testCustomSetUp [
	| suite runner |
	
	suite := SMarkTestSuite new.
	runner := SMarkTestRunner execute: suite.  
	
	self assert: runner hasSetUpBenchB
]

{ #category : #tests }
SMarkSuiteTest >> testCustomTearDown [
	| suite runner |
	suite := SMarkTestSuite new.
	runner := SMarkTestRunner execute: suite.  
	
	self assert: runner hasTearDownBenchC.
]

{ #category : #tests }
SMarkSuiteTest >> testSetUp [
	| suite runner |
	suite := SMarkTestSuite new.
	
	self assert: suite a			equals: 1.
	self assert: suite b			equals: 2.
	self assert: suite c			equals: #three.
	
	runner := SMarkTestRunner execute: suite.
	
	"Make sure they are reset after each run,
	 well we test just whether they are reset after the final run"
	self assert: suite a			equals: nil.
	self assert: suite b			equals: nil.
	self assert: suite c			equals: nil.
	self assert: suite d			equals: nil.

	"Make sure setUp was called 4 times."
	
	self assert: 4 equals: runner setUpCount.
]

{ #category : #tests }
SMarkSuiteTest >> testSetupAndTeaddownCalledForEveryBenchForEveryIteration [
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
]

{ #category : #tests }
SMarkSuiteTest >> testShouldRunSelector [
	| suite |
	suite := SMarkSuite new.
	
	self assert: (suite shouldRunSelector: #benchSomething).
	self assert: (suite shouldRunSelector: #benchsomeThingElse).
	
	self deny: (suite shouldRunSelector: #nobenchSomeThing).
	self deny: (suite shouldRunSelector: #BenchSomeThing).
]

{ #category : #tests }
SMarkSuiteTest >> testTearDown [
	| suite runner |
	suite := SMarkTestSuite new.
	runner := SMarkTestRunner execute: suite.  
	
	self assert: 4 equals: runner tearDownCount.
]
