initialize-release
mask: p islands: i
    ^ i = 0
        ifTrue:  [pieceFactory new mask: p]
        ifFalse: [pieceWithIsland new mask: p; islands: i]