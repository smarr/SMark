generating
rotate: aPieceMask
    | rotatedMask pivot rotatedPivot irow row |
    rotatedMask := 0.
    irow := 1.
    row := aPieceMask bitAnd: (southToNorthMasks at: irow).
    rotatedPivot := pivot := 1 bitShift: row highBit - 1.
    
    [rotatedMask := rotatedMask + rotatedPivot.
    [(row bitAnd: pivot - 1) = 0]
        whileFalse:
            [pivot := self shiftE: pivot.
            rotatedPivot := self shiftNE: rotatedPivot.
            (row bitAnd: pivot) = 0
                ifFalse:
                    [rotatedMask := rotatedMask + rotatedPivot]].
    (row := aPieceMask bitAnd: (southToNorthMasks at: (irow := irow + 1))) = 0]
        whileFalse:
            [(self canShiftNE: pivot)
                ifTrue:
                    [pivot := self shiftNE: pivot.
                    rotatedPivot := self shiftNW: rotatedPivot]
                ifFalse:
                    [pivot := self shiftNW: pivot.
                    rotatedPivot := self shiftW: rotatedPivot].
            [row >= (pivot bitShift: 1)]
                whileTrue:
                    [pivot := self shiftW: pivot.
                    (self canShiftSW: rotatedPivot)
                        ifFalse:
                            [rotatedPivot := rotatedPivot bitShift: twoRows.
                            rotatedMask := rotatedMask bitShift: twoRows.].
                    rotatedPivot := self shiftSW: rotatedPivot]].
    ^self shiftSEmost: rotatedMask