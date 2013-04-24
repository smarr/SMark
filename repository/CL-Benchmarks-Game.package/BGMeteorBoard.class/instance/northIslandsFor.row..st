islands
northIslandsFor: aPieceMask row: iRow
    | filled isleSEW bitReverse isleNE isleNW |
    bitReverse := (#(-1 -1 6 4 2) at: iRow) * ncol.
    filled := aPieceMask bitOr: aPieceMask - 1.
    isleSEW := self islandsFor: filled.
    (aPieceMask bitAnd: (eastEdge bitOr: westEdge)) = 0 ifFalse: [^isleSEW].
    (isleSEW bitAnd: (eastEdge bitOr: westEdge)) = 0 ifFalse: [^isleSEW].
    (southEdge bitAnd: aPieceMask) = 0
        ifTrue: [filled := (filled bitShift: 0 - ncol) bitShift: ncol].
    isleNE := ((self islandsFor: (filled bitReverse: bitReverse)) bitReverse: bitReverse) bitOr: isleSEW.
    isleNW := ((1 bitShift: bitReverse) - 1 - (isleNE bitOr: (aPieceMask bitOr: aPieceMask - 1))) bitOr: isleSEW.
    ^isleNW bitCount < isleNE bitCount
        ifTrue: [isleNW]
        ifFalse: [isleNE]