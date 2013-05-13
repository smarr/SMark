initialize-release
mask: p islands: i
    ^ i = 0
        ifTrue:  [self createMeteorPiece mask: p]
        ifFalse: [self createMeteorPieceWithIsland mask: p; islands: i]