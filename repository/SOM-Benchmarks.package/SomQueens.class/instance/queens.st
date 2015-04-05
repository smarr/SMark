queens
queens
        freeRows  := Array new:  8 withAll: true.
        freeMaxs  := Array new: 16 withAll: true.
        freeMins  := Array new: 16 withAll: true.
        queenRows := Array new:  8 withAll: -1.
        ^ self placeQueen: 1