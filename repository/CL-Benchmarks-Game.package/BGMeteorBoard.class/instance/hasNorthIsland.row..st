islands
hasNorthIsland: aPieceMask row: iRow
    | bitReverse |
    bitReverse := (#(-1 -1 6 4 2) at: iRow) * ncol.
    ^self hasSouthIsland: (aPieceMask bitReverse: bitReverse)