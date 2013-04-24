*CL-Benchmarks-Game-Meteor-bit manipulation
bitsDo: aBlock
    | mask |
    self < 0 ifTrue: [^self error: 'Cannot enumerate bits of a negative integer'].
    mask := self.
    [mask = 0]
        whileFalse:
            [aBlock value: mask lowBit.
            mask := mask bitAnd: mask - 1]