initialize
start
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
