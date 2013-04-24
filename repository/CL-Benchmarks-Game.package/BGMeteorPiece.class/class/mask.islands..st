instance creation
mask: p islands: i
    ^ i = 0
        ifTrue:  [BGMeteorPiece new mask: p]
        ifFalse: [BGMeteorPieceWithIsland new mask: p; islands: i]