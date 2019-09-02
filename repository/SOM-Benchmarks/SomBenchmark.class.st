Class {
	#name : #SomBenchmark,
	#superclass : #Object,
	#instVars : [
		'numIterations',
		'numWarmUpIterations',
		'innerIterations',
		'printIndividualRuns',
		'maxRuntime',
		'total'
	],
	#category : 'SOM-Benchmarks'
}

{ #category : #converting }
SomBenchmark >> assert: expected equals: value [
	expected = value ifFalse: [
		self error: 'Expected value (', expected asString,
						') differs from actual (', value asString, ') benchmark result.'].
	^ true
]

{ #category : #benchmarking }
SomBenchmark >> benchmark [
	self subclassResponsibility
]

{ #category : #running }
SomBenchmark >> doRuns [
        | i  totalRunTime |
        i := 0.
        totalRunTime := 0.
        
        [ i < numIterations ] whileTrue: [
            | startTime endTime runTime |
            startTime := Time primUTCMicrosecondsClock.
            self innerBenchmarkLoop ifFalse: [
              self error: 'Benchmark failed with incorrect result'. ].
            endTime   := Time primUTCMicrosecondsClock.
            
            runTime := endTime - startTime.
            printIndividualRuns ifTrue: [ self printRun: runTime ].
            
            totalRunTime := totalRunTime + runTime.
            i := i + 1.
            
            maxRuntime ifNotNil: [
                totalRunTime > maxRuntime ifTrue: [
                    numIterations := i.
                    ^ totalRunTime ]].
            
            Smalltalk garbageCollect ].
        
        ^ totalRunTime
]

{ #category : #running }
SomBenchmark >> exec [
	     ScriptConsole << (('Starting ', self name), ' benchmark ... ').
        self warmup.
        total := self doRuns.
]

{ #category : #benchmarking }
SomBenchmark >> innerBenchmarkLoop [
        | i |
        i := 0.
        [ i < innerIterations ] whileTrue: [
            (self verifyResult: self benchmark) ifFalse: [ ^ false ].
            i := i + 1.
        ].
        ^ true
]

{ #category : #accessing }
SomBenchmark >> innerIterations [
	^ innerIterations
]

{ #category : #accessing }
SomBenchmark >> maxRuntime: seconds [
        "converted to microseconds i.e. ticks"
        seconds ifNotNil: [
            maxRuntime := seconds * 1000 * 1000].

]

{ #category : #accessing }
SomBenchmark >> name [
	| className |
	"Remove Som prefix"
	className := self class name asString.
	^  className copyFrom: 4 to: className size
]

{ #category : #accessing }
SomBenchmark >> numIterations [
	^ numIterations
]

{ #category : #reporting }
SomBenchmark >> printRun: runTime [
        ScriptConsole << (self name, ': iterations=1 runtime: ', runTime asString, 'us'); cr
]

{ #category : #running }
SomBenchmark >> run [
        | harness |
        harness := SomAll new.
        harness initialize.
        harness benchmarkClasses: (OrderedCollection with: self class).
        harness printAll: false.
        harness maxRuntime: 3. "seconds"
        harness numIterations: 100.
        harness warmUp: 10.

        harness runBenchmarks.
        harness printTotal.
]

{ #category : #running }
SomBenchmark >> run: numIter with: numWarmUpIter and: numInner printAll: aBool [
        numIterations       := numIter.
        numWarmUpIterations := numWarmUpIter.
        innerIterations     := numInner.
        printIndividualRuns := aBool.
        
        self exec.
]

{ #category : #accessing }
SomBenchmark >> total [
	^ total
]

{ #category : #benchmarking }
SomBenchmark >> verifyResult: result [
	self subclassResponsibility
]

{ #category : #running }
SomBenchmark >> warmup [
        | numIterationsTmp printIndividualRunsTmp maxRuntimeTmp |
        numWarmUpIterations > 0 ifFalse: [
            ScriptConsole cr.
            ^ self].

        numIterationsTmp := numIterations.
        printIndividualRunsTmp := printIndividualRuns.
        maxRuntimeTmp := maxRuntime.

        numIterations := numWarmUpIterations.
        printIndividualRuns := false.
        maxRuntime := nil.

        ScriptConsole << ' warmup ...'.
        self doRuns.

        numIterations := numIterationsTmp.
        printIndividualRuns := printIndividualRunsTmp.
        maxRuntime := maxRuntimeTmp.

        ScriptConsole << ' completed.'.
]
