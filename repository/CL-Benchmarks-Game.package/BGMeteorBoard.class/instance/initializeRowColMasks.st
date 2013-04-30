initialize-release
initializeRowColMasks
    southEdge := (1 bitShift: ncol) - 1.
    southToNorthMasks := (intervalFactory from: 0 to: 5) collect: [:i | southEdge bitShift: ncol * i].
    eastEdge := (1 bitShift: sixRows)-1/southEdge.
    eastToWestMasks := (intervalFactory from: 0 to: ncol - 1) collect: [:i | eastEdge bitShift: i].
    westEdge := eastToWestMasks last.
    oddRowsMask := (1 bitShift: sixRows)-1/((1 bitShift: twoRows)-1)*southEdge.
    evenRowsMask := oddRowsMask bitShift: ncol.
    northWestMask := westEdge bitAnd: evenRowsMask.
    northEastMask := eastEdge bitAnd: oddRowsMask.
    southWestMask := southEdge bitOr: (westEdge bitAnd: evenRowsMask).
    southEastMask := southEdge bitOr: (eastEdge bitAnd: oddRowsMask).