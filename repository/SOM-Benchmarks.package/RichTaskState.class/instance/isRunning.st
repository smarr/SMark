testing
isRunning
    ^ packetPending not and: [taskWaiting not and: [taskHolding not]]