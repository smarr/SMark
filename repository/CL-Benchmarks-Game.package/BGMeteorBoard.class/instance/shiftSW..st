generating
shiftSW: aPieceMask
    | evens odds |
    odds := oddRowsMask bitAnd: aPieceMask.
    evens := evenRowsMask bitAnd: aPieceMask.
    ^(evens bitShift: 1) + odds bitShift: 0 - ncol