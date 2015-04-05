running
run
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