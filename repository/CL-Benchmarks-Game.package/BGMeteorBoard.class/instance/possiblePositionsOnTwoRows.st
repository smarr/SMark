generating
possiblePositionsOnTwoRows
    ^pieces collect: [:aPieceMask |
        | possible iRot |
        possible := (Array new: twoRows) collect: [:freeCell | Array new: 12 withAll: (pieceFactory new mask: 0)].
        iRot := 0.
        self rotationsOf: aPieceMask do: [:rotated |
            iRot := iRot + 1.
            self placesFor: rotated do: [:shifted |
                (possible at: shifted lowBit) at: iRot put: (self
                    mask: ((self hasEastOrWestIsland: shifted) ifTrue: [0] ifFalse: [shifted])
                    islands: (self islandsFor: (shifted bitOr: shifted - 1)))]].
        possible]