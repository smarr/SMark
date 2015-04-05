towers
move: disks disksFrom: fromPile to: toPile
        disks = 1
            ifTrue: [ self moveTopDiskFrom: fromPile to: toPile ]
            ifFalse: [ | otherPile |
                otherPile := (6 - fromPile) - toPile.
                self move: disks - 1 disksFrom: fromPile to: otherPile.
                self moveTopDiskFrom: fromPile to: toPile.
                self move: disks - 1 disksFrom: otherPile to: toPile. ]
