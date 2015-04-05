scheduling
addInput: packet checkPriority: oldTask
    RichObject NoWork == input
	ifTrue: 
	    [input := packet.
	    self packetPending: true.
	    priority > oldTask priority ifTrue: [ ^ self ]]
	ifFalse: 
	    [ input := self append: packet head: input ].
    ^ oldTask