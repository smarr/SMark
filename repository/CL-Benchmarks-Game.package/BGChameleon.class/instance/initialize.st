initialize-release
initialize
    meetings := 0.
    waitingForPair := Semaphore new.
    semaphore := Semaphore new