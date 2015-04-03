private
queuePacket: packet 
    | t |
    t := self findTask: packet identity.
    RichObject NoTask ==  t ifTrue: [ ^ RichObject NoTask ].
    queuePacketCount := queuePacketCount + 1.
    packet link: RichObject NoWork.
    packet identity: currentTaskIdentity.
    ^ t addInput: packet checkPriority: currentTask