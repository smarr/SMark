generating
shiftSE: aPieceMask
    | evens odds |
    odds := oddRowsMask bitAnd: aPieceMask.
    evens := evenRowsMask bitAnd: aPieceMask.
    ^(odds bitShift: -1) + evens bitShift: 0 - ncol