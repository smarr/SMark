running
run: numIter with: numWarmUpIter and: numInner printAll: aBool
        numIterations       := numIter.
        numWarmUpIterations := numWarmUpIter.
        innerIterations     := numInner.
        printIndividualRuns := aBool.
        
        self exec.