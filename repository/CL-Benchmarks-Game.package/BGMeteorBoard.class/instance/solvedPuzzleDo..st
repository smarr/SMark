solving
solvedPuzzleDo: solutionBlock
    loopCount := 0.
    self
        searchPuzzlesWithColorMask: (1 bitShift: pieces size) - 1
        boardMask: 0
        rowOffset: 0
        pieces: pieces copy
        ifFound: [:solution |
            solutionBlock value: solution; value: solution reverse].
    ^loopCount