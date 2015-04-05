scheduling
runTask
    | message |
    self isWaitingWithPacket
	ifTrue: 
	    [message := input.
	    input := message link.
	    RichObject NoWork == input 
		ifTrue: [self running]
		ifFalse: [self packetPending]]
	ifFalse: [message := RichObject NoWork].
    ^ function value: message value: handle