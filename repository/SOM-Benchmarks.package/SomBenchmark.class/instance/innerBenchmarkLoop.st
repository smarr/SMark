benchmarking
innerBenchmarkLoop
        | i |
        i := 0.
        [ i < innerIterations ] whileTrue: [
            (self verifyResult: self benchmark) ifFalse: [ ^ false ].
            i := i + 1.
        ].
        ^ true