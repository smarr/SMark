queens
placeQueen: c
        1 to: 8 do: [ :r | 
            (self row: r column: c)
                ifTrue: [
                    queenRows at: r put: c.
                    self row: r column: c put: false.
                    (c = 8) ifTrue: [ ^true ].
                    (self placeQueen: c + 1) ifTrue: [ ^true ].
                    self row: r column: c put: true ] ].
        ^false