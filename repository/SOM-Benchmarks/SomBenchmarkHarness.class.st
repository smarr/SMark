Class {
	#name : #SomBenchmarkHarness,
	#superclass : #Object,
	#instVars : [
		'total',
		'runtimes',
		'benchmarkClasses',
		'numIterations',
		'warmUp',
		'innerIterations',
		'maxRuntime',
		'printAll'
	],
	#category : 'SOM-Benchmarks'
}

{ #category : #'as yet unclassified' }
SomBenchmarkHarness class >> run: args [
	^ self new run: args
]

{ #category : #'as yet unclassified' }
SomBenchmarkHarness >> benchmarkClasses: classes [
	benchmarkClasses := classes
]

{ #category : #'as yet unclassified' }
SomBenchmarkHarness >> collectBenchmarkClasses: args [
        | i benchmarks |
        i := 2. "First argument is the BenchmarkHarness"
        
        benchmarks := OrderedCollection new: args size - 1.
        [i <= args size] whileTrue: [
            | sym cls |
            sym := #Som, (args at: i) asSymbol.
            cls := Smalltalk classNamed: sym.
            cls ifNil: [
                "This item does not seem to be a class, so it is most likely
                 one of the other parameters"
                 benchmarkClasses := benchmarks.
                 benchmarks size = 0 ifTrue: [ self error: 'No benchmark found' ].
                 ^ args copyFrom: i to: args size ].
            benchmarks add: cls.
            i := i + 1 ].
        benchmarks size = 0 ifTrue: [ self error: 'No benchmark found' ].

        benchmarkClasses := benchmarks.
        ^ nil
]

{ #category : #'as yet unclassified' }
SomBenchmarkHarness >> initialize [
        total         := 0.
        runtimes      := Dictionary new.
        numIterations := 1.
        warmUp        := 0.
        innerIterations := 1.
        maxRuntime    := nil.
        printAll      := true.
]

{ #category : #'as yet unclassified' }
SomBenchmarkHarness >> maxRuntime: seconds [
	maxRuntime := seconds
]

{ #category : #'as yet unclassified' }
SomBenchmarkHarness >> numIterations: anInt [
	numIterations := anInt
]

{ #category : #'as yet unclassified' }
SomBenchmarkHarness >> printAll: aBool [
	printAll := aBool
]

{ #category : #'as yet unclassified' }
SomBenchmarkHarness >> printTotal [
        ScriptConsole << ('Total Runtime: ', total asString, 'us').
]

{ #category : #'as yet unclassified' }
SomBenchmarkHarness >> printUsage [
  ScriptConsole << 'TODO [benchmarks] [num-iterations [warm-up [inner-iter]]]'; cr.
  ScriptConsole cr.
  ScriptConsole << '  benchmarks     - list of benchmark class names (e.g.: Queens Fibonacci Dispatch)'; cr.
  ScriptConsole << '  num-iterations - number of times each benchmark is executed, default: 1'; cr.
  ScriptConsole << '  warm-up        - number of times each benchmark is executed before measuring, default: 0'; cr.
  ScriptConsole << '  inner-iter     - number of times each benchmark is executed in an inner loop, which is measured in total, default: 1'; cr.
]

{ #category : #'as yet unclassified' }
SomBenchmarkHarness >> processArguments: args [
        | remainingArgs |
        remainingArgs := self collectBenchmarkClasses: args.
        remainingArgs ifNotNil: [
            numIterations := (remainingArgs at: 1) asInteger.
            remainingArgs size > 1 ifTrue: [
                warmUp := (remainingArgs at: 2) asInteger.
                remainingArgs size > 2 ifTrue: [
                    innerIterations := (remainingArgs at: 3) asInteger.
                ].
            ].
        ]
]

{ #category : #'as yet unclassified' }
SomBenchmarkHarness >> reportRun: bench [
        ScriptConsole << (bench name, ': iterations=',
						        bench numIterations asString,
						        ' average: ',
						        (bench total / bench numIterations) asString,
						        'us total: ',
						        bench total asString, 'us'); cr
]

{ #category : #'as yet unclassified' }
SomBenchmarkHarness >> run: args [
        args size < 2 ifTrue: [ ^ self printUsage ].
        
        self initialize.
        self processArguments: args.

        self runBenchmarks.
        self printTotal.
]

{ #category : #'as yet unclassified' }
SomBenchmarkHarness >> runBenchmarks [
        benchmarkClasses do: [ :benchmark |
            | bench |
            bench := benchmark new.
            bench maxRuntime: maxRuntime.
            
            bench run: numIterations with: warmUp and: innerIterations printAll: printAll.
            total := total + bench total.
            runtimes at: benchmark put: bench total.
            
            self reportRun: bench.

            ScriptConsole cr. ]
]

{ #category : #'as yet unclassified' }
SomBenchmarkHarness >> total [
	^ total
]

{ #category : #'as yet unclassified' }
SomBenchmarkHarness >> warmUp: anInt [
	warmUp := anInt
]
