running
warmup
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