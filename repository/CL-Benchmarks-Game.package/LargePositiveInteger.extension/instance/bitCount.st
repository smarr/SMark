*CL-Benchmarks-Game-Meteor-bit manipulation
bitCount
    "Count the number of bits set to 1 in self"

    | bitCount |
    bitCount := 0.
    1 to: self digitLength do: [:i |
        bitCount := bitCount + (self digitAt: i) bitCountOfByte].
    ^bitCount