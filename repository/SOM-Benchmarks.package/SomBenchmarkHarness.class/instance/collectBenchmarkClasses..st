as yet unclassified
collectBenchmarkClasses: args
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