*CL-Benchmarks-Game-Meteor-bit manipulation
bitCount
    | count remainder |
    count := 0.
    remainder := self.
    [count := count + (BGBitOps bitCountOfByte: (remainder bitAnd: 255)).
    remainder > 255]
        whileTrue:
            [remainder := remainder bitShift: -8].
    ^count