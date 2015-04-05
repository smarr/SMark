utilities
append: packet head: queueHead
    | mouse link |
    packet link: RichObject NoWork.
    RichObject NoWork == queueHead ifTrue: [ ^ packet ].
    mouse := queueHead.
    [RichObject NoWork == (link := mouse link)]
        whileFalse: [ mouse := link ].
    mouse link: packet.
    ^ queueHead