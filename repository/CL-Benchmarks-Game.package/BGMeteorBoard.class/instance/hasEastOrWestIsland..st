islands
hasEastOrWestIsland: aMask
    ^ (self hasInsetZero: southEdge * (eastEdge bitAnd: aMask))
        or: [(self hasInsetZero: southEdge * (westEdge bitAnd: aMask))
            or: [(aMask bitAnd: eastEdge) > 0 and: [(aMask bitAnd: westEdge) > 0 and: [(self findIsland: aMask) bitCount \\ 5 > 0]]]]