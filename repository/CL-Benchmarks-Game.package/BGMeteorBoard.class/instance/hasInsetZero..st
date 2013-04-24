islands
hasInsetZero: aMask
    | allOnes |
    allOnes := aMask bitOr: aMask - 1.
    ^ (allOnes bitAnd: allOnes + 1) > 0