solving
searchPuzzlesWithColorMask: colorMask boardMask: bMask rowOffset: rowOff pieces: pArray ifFound: solutionBlock
    | nextFreeCell possibles colorBit iRow boardMask |
    colorMask = 0 ifTrue: [ ^solutionBlock value: (self boardStringWithPieces: pieces) ].
    loopCount := loopCount + 1.
    boardMask := bMask.
    iRow := rowOff.
    [(nextFreeCell := (boardMask + 1) lowBit) > twoRows]
        whileTrue:
            [ iRow := iRow + 2.
            boardMask := boardMask bitShift: 0 - twoRows ].
    possibles := (positionsPerPiece at: iRow // 2 + 1) at: nextFreeCell.
    colorBit := 1.
    1 to: pieces size do: [:pieceNumber |
        (colorMask bitAnd: colorBit) = 0
            ifFalse:
                [ | positions |
                positions := possibles at: pieceNumber.
                1 to: positions size do: [:i |
                    | aPiece |
                    ((aPiece := positions at: i) fitOnBoard: boardMask)
                        ifTrue:
                            [pieces at: pieceNumber put: (aPiece forRow: iRow).
                            self
                                searchPuzzlesWithColorMask: colorMask - colorBit
                                boardMask: boardMask + aPiece mask
                                rowOffset: iRow
                                pieces: pArray
                                ifFound: solutionBlock]]].
        colorBit := colorBit * 2].
    ^nil