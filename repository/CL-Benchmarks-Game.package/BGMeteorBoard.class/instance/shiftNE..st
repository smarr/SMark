generating
shiftNE: aPieceMask
    | evens odds |
    odds := oddRowsMask bitAnd: aPieceMask.
    evens := evenRowsMask bitAnd: aPieceMask.
    ^(odds bitShift: -1) + evens bitShift: ncol