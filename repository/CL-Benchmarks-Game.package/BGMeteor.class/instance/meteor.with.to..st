benchmarking
meteor: nMax with: aBoard to: outputStream
    | board count minSolution maxSolution |
    count := 0.
    minSolution := ByteString new: 50 withAll: $9.
    maxSolution := ByteString new: 50 withAll: $0.
    aBoard solvedPuzzleDo:
        [:aString |
            count := count + 1.
            aString < minSolution ifTrue: [minSolution := aString].
            aString > maxSolution ifTrue: [maxSolution := aString]]. 
    outputStream print: count; nextPutAll: ' solutions found'; cr; cr.
    aBoard printSolution: minSolution on: outputStream.
    outputStream cr.
    aBoard printSolution: maxSolution on: outputStream.
    outputStream cr.