testing
isWaiting
    ^packetPending not and: [taskWaiting and: [taskHolding not]]