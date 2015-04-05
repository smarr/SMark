running
doRuns
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