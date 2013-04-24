generating
rotationsOf: aPieceMask do: aBlock
    | next |
    aBlock value: (next := aPieceMask); value: (self flip: next).
    5 timesRepeat:  [aBlock value: (next := self rotate: next); value: (self flip: next)]