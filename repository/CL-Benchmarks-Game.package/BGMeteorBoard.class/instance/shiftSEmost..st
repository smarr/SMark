generating
shiftSEmost: aPieceMask
    | mostSEMask eastColumn lowBit |
    aPieceMask odd ifTrue: [^aPieceMask].
    lowBit := aPieceMask lowBit.
    mostSEMask := aPieceMask bitShift: 0 -  (lowBit - 1 // twoRows * twoRows).
    (mostSEMask bitAnd: southEdge) = 0
        ifTrue: [mostSEMask := (self canShiftSE: mostSEMask)
            ifTrue: [self shiftSE: mostSEMask]
            ifFalse: [self shiftSW: mostSEMask]].
    eastColumn := eastToWestMasks findFirst: [:e | (e bitAnd: mostSEMask) > 0].
    ^mostSEMask bitShift: 1 - eastColumn