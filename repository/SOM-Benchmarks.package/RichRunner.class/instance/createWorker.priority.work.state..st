creation
createWorker: identity priority: priority work: work state: state 
    | data |
    data := RichWorkerTaskDataRecord create.
    self
	createTask: identity
	priority: priority
	work: work
	state: state
	function: 
	    [:work1 :word | | data1 |
	    data1 := word.
	    RichObject NoWork == work1
		ifTrue: [self wait]
		ifFalse: 
		    [data1 destination: (RichObject HandlerA = data1 destination
			    ifTrue:  [RichObject HandlerB]
			    ifFalse: [RichObject HandlerA]).
		    work1 identity: data1 destination.
		    work1 datum: 1.
		    1 to: 4 do: [ :i | 
			data1 count: data1 count + 1.
			data1 count > 26 ifTrue: [data1 count: 1].
			work1 data at: i put: $A asInteger + data1 count - 1].
		    self queuePacket: work1]]
	data: data