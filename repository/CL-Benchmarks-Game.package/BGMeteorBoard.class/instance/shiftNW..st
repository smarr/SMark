generating
shiftNW: aPieceMask
    | evens odds |
    odds := oddRowsMask bitAnd: aPieceMask.
    evens := evenRowsMask bitAnd: aPieceMask.
    ^(evens bitShift: 1) + odds bitShift: ncol