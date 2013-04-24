islands
islandsFor: aPieceMask
    | islands aMask nextFreeCellMask open top |
    islands := 0.
    fillMask := aPieceMask.
    top := 1 bitShift: (fillMask highBit - 1 // ncol * ncol - 1).
    [(nextFreeCellMask := 1 + fillMask bitAnd: -1 - fillMask) <= top]
        whileTrue:
            [open := false.
            aMask := fillMask.
            self fillMaskStartingAt: nextFreeCellMask stoppingAbove: top ifFoundEnough: [open := true].
            open ifFalse: [islands := islands + (fillMask - aMask)]].
    ^islands