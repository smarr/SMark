"
Richards simulates the task dispatcher of an operating system.
"
Class {
	#name : #RichRunner,
	#superclass : #Object,
	#instVars : [
		'taskList',
		'currentTask',
		'currentTaskIdentity',
		'taskTable',
		'tracing',
		'layout',
		'queuePacketCount',
		'holdCount'
	],
	#category : 'SOM-Benchmarks-Richards'
}

{ #category : #starting }
RichRunner class >> start [
    "RichardsBenchmark start"

    ^self new start
]

{ #category : #creation }
RichRunner >> createDevice: identity priority: priority work: work state: state [ 
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
]

{ #category : #creation }
RichRunner >> createHandler: identity priority: priority work: work state: state [ 
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
]

{ #category : #creation }
RichRunner >> createIdler: identity priority: priority work: work state: state [ 
    | data |
    data := RichIdleTaskDataRecord create.
    self
	createTask: identity
	priority: priority
	work: work
	state: state
	function: 
	    [:work1 :word | | data1 |
	    data1 := word.
	    data1 count: data1 count - 1.
	    0 = data1 count
		ifTrue: [self holdSelf]
		ifFalse:
		    [0 = (data1 control bitAnd: 1)
			ifTrue: 
			    [data1 control: data1 control // 2.
			    self release: RichObject DeviceA]
			ifFalse: 
			    [data1 control: (data1 control // 2 bitXor: 53256).
			    self release: RichObject DeviceB]]]
	data: data
]

{ #category : #creation }
RichRunner >> createPacket: link identity: identity kind: kind [ 
    ^ RichPacket
		create: link
		identity: identity
		kind: kind
]

{ #category : #creation }
RichRunner >> createTask: identity priority: priority work: work state: state function: aBlock data: data [ 
    | t |
    t := RichTaskControlBlock
		link: taskList
		create: identity
		priority: priority
		initialWorkQueue: work
		initialState: state
		function: aBlock
		privateData: data.
    taskList := t.
    taskTable at: identity put: t
]

{ #category : #creation }
RichRunner >> createWorker: identity priority: priority work: work state: state [ 
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
]

{ #category : #private }
RichRunner >> findTask: identity [ 
    | t |
    t := taskTable at: identity.
    RichObject NoTask == t ifTrue: [self error: 'findTask failed'].
    ^ t
]

{ #category : #private }
RichRunner >> holdSelf [
    holdCount := holdCount + 1.
    currentTask taskHolding: true.
    ^ currentTask link
]

{ #category : #private }
RichRunner >> initScheduler [
    queuePacketCount := 0.
    holdCount := 0.
    taskTable := Array new: 6 withAll: RichObject NoTask.
    taskList := RichObject NoTask.
]

{ #category : #private }
RichRunner >> initTrace [
	tracing := false.
	layout := 0
]

{ #category : #private }
RichRunner >> queuePacket: packet [ 
    | t |
    t := self findTask: packet identity.
    RichObject NoTask ==  t ifTrue: [ ^ RichObject NoTask ].
    queuePacketCount := queuePacketCount + 1.
    packet link: RichObject NoWork.
    packet identity: currentTaskIdentity.
    ^ t addInput: packet checkPriority: currentTask
]

{ #category : #private }
RichRunner >> release: identity [ 
    | t |
    t := self findTask: identity.
    RichObject NoTask == t ifTrue: [ ^ RichObject NoTask ].
    t taskHolding: false.
    t priority > currentTask priority
		ifTrue: [ ^ t ]
		ifFalse: [ ^ currentTask ]
]

{ #category : #scheduling }
RichRunner >> schedule [
    currentTask := taskList. 
    [RichObject NoTask == currentTask]
		whileFalse: 
	    [currentTask isTaskHoldingOrWaiting
			ifTrue: [currentTask := currentTask link]
			ifFalse: 
		    [currentTaskIdentity := currentTask identity.
			 tracing ifTrue: [ self trace: currentTaskIdentity ].
		    currentTask := currentTask runTask]]
]

{ #category : #initialize }
RichRunner >> start [
    | workQ |
	 self initTrace.
    self initScheduler.
    self 	createIdler: RichObject Idler
			priority: 0
			work: RichObject NoWork
			state: RichTaskState running.
    workQ := self
		createPacket: RichObject NoWork
		identity: RichObject Worker
		kind: RichObject WorkPacketKind.
    workQ := self
		createPacket: workQ
		identity: RichObject Worker
		kind: RichObject WorkPacketKind.
    self
		createWorker: RichObject Worker
		priority: 1000
		work: workQ
		state: RichTaskState waitingWithPacket.
    workQ := self
		createPacket: RichObject NoWork
		identity: RichObject DeviceA
		kind: RichObject DevicePacketKind.
    workQ := self
		createPacket: workQ
		identity: RichObject DeviceA
		kind: RichObject DevicePacketKind.
    workQ := self
		createPacket: workQ
		identity: RichObject DeviceA
		kind: RichObject DevicePacketKind.
    self
		createHandler: RichObject HandlerA
		priority: 2000
		work: workQ
		state: RichTaskState waitingWithPacket.
    workQ := self
		createPacket: RichObject NoWork
		identity: RichObject DeviceB
		kind: RichObject DevicePacketKind.
    workQ := self
		createPacket: workQ
		identity: RichObject DeviceB
		kind: RichObject DevicePacketKind.
    workQ := self
		createPacket: workQ
		identity: RichObject DeviceB
		kind: RichObject DevicePacketKind.
    self
		createHandler: RichObject HandlerB
		priority: 3000
		work: workQ
		state: RichTaskState waitingWithPacket.
    self
		createDevice: RichObject DeviceA
		priority: 4000
		work: RichObject NoWork
		state: RichTaskState waiting.
    self
		createDevice: RichObject DeviceB
		priority: 5000
		work: RichObject NoWork
		state: RichTaskState waiting.
    
	 self schedule.
    ^ (queuePacketCount = 23246) & (holdCount = 9297)

]

{ #category : #private }
RichRunner >> wait [ 
    currentTask taskWaiting: true.
    ^ currentTask
]
