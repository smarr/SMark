testing
isWaitingWithPacket
    ^packetPending and: [taskWaiting and: [taskHolding not]]