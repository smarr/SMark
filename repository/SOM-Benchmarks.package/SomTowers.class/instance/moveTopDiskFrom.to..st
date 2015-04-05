towers
moveTopDiskFrom: fromPile to: toPile
        self pushDisk: (self popDiskFrom: fromPile) onPile: toPile.
        movesdone := movesdone + 1.