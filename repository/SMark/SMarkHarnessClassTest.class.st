Class {
	#name : #SMarkHarnessClassTest,
	#superclass : #TestCase,
	#category : 'SMark-Tests'
}

{ #category : #tests }
SMarkHarnessClassTest >> testShouldShowUsage [
	| example1 example2 example3 example4 |
	example1 := { #ignored. '--help' }.
	example2 := { #ignored. }.
	example3 := { #ignored. '-?'}.
	example4 := { #ignored. 1. 2. }.
	
	self assert: (SMarkHarness shouldShowUsage: example1).
	self assert: (SMarkHarness shouldShowUsage: example2).
	self assert: (SMarkHarness shouldShowUsage: example3).
	self deny:   (SMarkHarness shouldShowUsage: example4).

]
