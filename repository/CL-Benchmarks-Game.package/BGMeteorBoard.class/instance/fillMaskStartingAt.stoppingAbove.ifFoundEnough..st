islands
fillMaskStartingAt: pos stoppingAbove: maxCell ifFoundEnough: exitBlock
    (fillMask bitAnd: pos) = 0 ifFalse: [^self].
    (pos > maxCell) ifTrue: [^exitBlock value].
    fillMask := fillMask + pos.
    (self canShiftE: pos) ifTrue: [self fillMaskStartingAt: (self shiftE: pos) stoppingAbove: maxCell ifFoundEnough: exitBlock].
    (self canShiftNE: pos) ifTrue: [self fillMaskStartingAt: (self shiftNE: pos) stoppingAbove: maxCell ifFoundEnough: exitBlock].
    (self canShiftNW: pos) ifTrue: [self fillMaskStartingAt: (self shiftNW: pos) stoppingAbove: maxCell ifFoundEnough: exitBlock].
    (self canShiftW: pos) ifTrue: [self fillMaskStartingAt: (self shiftW: pos) stoppingAbove: maxCell ifFoundEnough: exitBlock].
    ^self