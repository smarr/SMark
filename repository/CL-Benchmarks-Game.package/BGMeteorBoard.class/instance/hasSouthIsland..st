islands
hasSouthIsland: aMask
    ^(self findIsland: aMask) bitCount \\ 5 > 0
        or: [(self findIsland: fillMask) bitCount \\ 5 > 0]