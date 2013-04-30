initialize-release
initializePossiblePositions
    | positionsPerPiecePerCell thePieceWhichBreakSymmetry |
    positionsPerPiecePerCell := self possiblePositionsOnTwoRows.
    thePieceWhichBreakSymmetry := 6.
    positionsPerPiece := (intervalFactory from: 1 to: 5) collect: [:iRow |
        | maxMaskForRow northRow |
        maxMaskForRow := (1 bitShift: (#(6 6 6 4 2) at: iRow) * ncol) - 1.
        northRow :=  southEdge bitShift: ((#(-1 -1 6 4 2) at: iRow) - 1 * ncol).
        (intervalFactory from: 1 to: twoRows) collect: [:cellNumber |
            (intervalFactory from: 1 to: pieces size) collect: [:pieceNumber |
                | orientations n str |
                orientations := (positionsPerPiecePerCell at: pieceNumber) at: cellNumber.
                n := pieceNumber = thePieceWhichBreakSymmetry ifTrue: [6] ifFalse: [12].
                str := (arrayFactory new: n) writeStream.
                1 to: n do: [:i |
                    | aPiece |
                    aPiece := orientations at: i.
                    (aPiece mask > 0 and: [aPiece mask <= maxMaskForRow])
                        ifTrue:
                            [(iRow = 1 and: [cellNumber <= ncol])
                                ifTrue: [(self hasSouthIsland: aPiece mask)
                                    ifFalse: [str nextPut: (self mask: aPiece mask islands: 0)]]
                                ifFalse: [(aPiece mask bitAnd: northRow) > 0
                                    ifTrue: [(self hasNorthIsland: aPiece mask row: iRow)
                                        ifFalse:
                                            [| isle |
                                            isle := iRow = 5
                                                ifTrue: [0]
                                                ifFalse: [self northIslandsFor: aPiece mask row: iRow].
                                            str nextPut: (self mask: aPiece mask islands: isle)]]
                                    ifFalse: [str nextPut: aPiece]]]].
                str contents]]]