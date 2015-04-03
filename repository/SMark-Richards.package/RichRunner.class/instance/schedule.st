scheduling
schedule
    currentTask := taskList. 
    [RichObject NoTask == currentTask]
		whileFalse: 
	    [currentTask isTaskHoldingOrWaiting
			ifTrue: [currentTask := currentTask link]
			ifFalse: 
		    [currentTaskIdentity := currentTask identity.
			 tracing ifTrue: [ self trace: currentTaskIdentity ].
		    currentTask := currentTask runTask]]