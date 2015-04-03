creation
createDevice: identity priority: priority work: work state: state 
    | data |
    data := RichDeviceTaskDataRecord create.
    self
	createTask: identity
	priority: priority
	work: work
	state: state
	function: 
	    [:work1 :word | | data1 functionWork |
	    data1 := word.
	    functionWork := work1.
	    RichObject NoWork == functionWork 
		ifTrue:
		    [RichObject NoWork == (functionWork := data1 pending)
			ifTrue: [self wait]
			ifFalse: 
			    [data1 pending: RichObject NoWork.
			    self queuePacket: functionWork]]
		ifFalse: 
		    [data1 pending: functionWork.
			tracing ifTrue: [ self trace: functionWork datum ].
		    self holdSelf]]
	data: data