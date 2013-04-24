*CL-Benchmarks-Game-Meteor-bit manipulation
bitsDo: aBlock
    | mask offset |
    1 to: self digitLength do: [:iByte |
        offset := iByte - 1 bitShift: 3.
        mask := self digitAt: iByte.
        [mask = 0]
            whileFalse:
                [aBlock value: mask lowBit + offset.
                mask := mask bitAnd: mask - 1]]