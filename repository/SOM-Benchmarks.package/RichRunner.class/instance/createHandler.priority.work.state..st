creation
createHandler: identity priority: priority work: work state: state 
    | data |
    data := RichHandlerTaskDataRecord create.
    self
	createTask: identity
	priority: priority
	work: work
	state: state
	function: 
	    [:work1 :word | | data1 workPacket |
	    data1 := word.
	    RichObject NoWork == work1 
		ifFalse: [RichObject WorkPacketKind == work1 kind 
		    ifTrue: [data1 workInAdd: work1]
		    ifFalse: [data1 deviceInAdd: work1]].
	    RichObject NoWork == (workPacket := data1 workIn) 
		ifTrue: [self wait]
		ifFalse: 
		    [ | count |
			count := workPacket datum.
		    count > 4
			ifTrue: 
			    [data1 workIn: workPacket link.
			    self queuePacket: workPacket]
			ifFalse:
			    [ | devicePacket |
				RichObject NoWork == (devicePacket := data1 deviceIn) 
				ifTrue: [self wait]
				ifFalse: 
				    [data1 deviceIn: devicePacket link.
				    devicePacket datum: (workPacket data at: count).
				    workPacket datum: count + 1.
				    self queuePacket: devicePacket]]]]
	data: data