generating
flip: aPieceMask
    ^self shiftSEmost: ((southToNorthMasks
        inject: 0 into: [:mask :rowMask |
            (mask bitShift:  ncol) + ((rowMask bitAnd: aPieceMask) bitShift: 1 - rowMask lowBit)])
                bitShift: 0 - ncol)