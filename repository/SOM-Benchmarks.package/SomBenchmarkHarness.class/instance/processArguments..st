as yet unclassified
processArguments: args
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