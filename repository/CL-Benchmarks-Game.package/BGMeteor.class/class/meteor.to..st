as yet unclassified
meteor: nMax to: outputStream
    | board count minSolution maxSolution |
    count := 0.
    minSolution := String new: 50 withAll: $9.
    maxSolution := String new: 50 withAll: $0.
    (board := BGMeteorBoard default) solvedPuzzleDo:
        [:aString |
            count := count + 1.
            aString < minSolution ifTrue: [minSolution := aString].
            aString > maxSolution ifTrue: [maxSolution := aString]]. 
    outputStream print: count; nextPutAll: ' solutions found'; cr; cr.
    board printSolution: minSolution on: outputStream.
    outputStream cr.
    board printSolution: maxSolution on: outputStream.
    outputStream cr.