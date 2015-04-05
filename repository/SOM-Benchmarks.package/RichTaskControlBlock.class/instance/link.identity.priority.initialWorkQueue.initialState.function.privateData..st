initialize
link: aLink identity: anIdentity priority: aPriority initialWorkQueue: anInitialWorkQueue initialState: anInitialState function: aBlock privateData: aPrivateData 
    link := aLink.
    identity := anIdentity.
    priority := aPriority.
    input := anInitialWorkQueue.
    self packetPending: anInitialState isPacketPending.
    self taskWaiting: anInitialState isTaskWaiting.
    self taskHolding: anInitialState isTaskHolding.
    function := aBlock.
    handle := aPrivateData