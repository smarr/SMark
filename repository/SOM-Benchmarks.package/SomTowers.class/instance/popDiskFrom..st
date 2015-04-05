towers
popDiskFrom: pile
        | top |
        
        top := piles at: pile.
        top isNil
            ifTrue: [
                self error: 'Attempting to remove a disk from an empty pile' ].
        
        piles at: pile put: top next.
        top next: nil.
        ^top