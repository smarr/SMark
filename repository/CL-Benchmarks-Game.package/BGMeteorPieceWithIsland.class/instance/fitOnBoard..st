testing
fitOnBoard: aBoardMask
    | occupied |
    ^0 == (aBoardMask bitAnd: mask) and:
        [(occupied := aBoardMask bitAnd: islands) = islands
            or: [aPieceCouldFitIntoIsland and: [(islands - occupied) bitCount = 5]]]