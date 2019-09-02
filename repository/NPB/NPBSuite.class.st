Class {
	#name : #NPBSuite,
	#superclass : #SMarkSuite,
	#instVars : [
		'bench'
	],
	#category : 'NPB'
}

{ #category : #transporter }
NPBSuite class >> transportersForFileOutMenu [
	^ { (Smalltalk at: #Transporter ifAbsent: [^#()])
			forPackage: (PackageInfo named: 'NPB') }
]

{ #category : #benchmarking }
NPBSuite >> benchIS [
	"Run the IS benchmark"
	bench run.
]

{ #category : #benchmarking }
NPBSuite >> setUpBenchIS [
	"Prepare IS benchmark"
	| sizeClass threadCnt |
	
	sizeClass := runner problemSize.
	sizeClass ifNil:	[ sizeClass := NPBIS defaultProblemSize. ].
	
	threadCnt := runner processes.
	
	bench := NPBIS newOfSizeClass: sizeClass with: threadCnt serial: (threadCnt == 0).
	bench runner: runner.
]
