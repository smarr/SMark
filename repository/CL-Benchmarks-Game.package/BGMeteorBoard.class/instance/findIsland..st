islands
findIsland: aMask
    | nextFreeCellMask open |
    nextFreeCellMask := 1 + aMask bitAnd: -1 - aMask.
    fillMask :=  aMask.
    open := false.
    self fillMaskStartingAt: nextFreeCellMask stoppingAbove: (1 bitShift: fillMask highBit - 1 // ncol * ncol - 1) ifFoundEnough: [open := true].
    ^open
        ifTrue: [0]
        ifFalse: [fillMask - aMask]