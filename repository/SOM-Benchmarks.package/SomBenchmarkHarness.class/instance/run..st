as yet unclassified
run: args
        args size < 2 ifTrue: [ ^ self printUsage ].
        
        self initialize.
        self processArguments: args.

        self runBenchmarks.
        self printTotal.