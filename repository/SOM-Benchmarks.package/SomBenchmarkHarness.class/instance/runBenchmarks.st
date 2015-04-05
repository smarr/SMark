as yet unclassified
runBenchmarks
        benchmarkClasses do: [ :benchmark |
            | bench |
            bench := benchmark new.
            bench maxRuntime: maxRuntime.
            
            bench run: numIterations with: warmUp and: innerIterations printAll: printAll.
            total := total + bench total.
            runtimes at: benchmark put: bench total.
            
            self reportRun: bench.

            ScriptConsole cr. ]