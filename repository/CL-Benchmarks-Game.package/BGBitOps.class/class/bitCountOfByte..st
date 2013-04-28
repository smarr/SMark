helpers
bitCountOfByte: anInt
    "Count the number of bits set to 1 in a byte."

    ^#[0 1 1 2 1 2 2 3 1 2 2 3 2 3 3 4
       1 2 2 3 2 3 3 4 2 3 3 4 3 4 4 5
       1 2 2 3 2 3 3 4 2 3 3 4 3 4 4 5
       2 3 3 4 3 4 4 5 3 4 4 5 4 5 5 6
       1 2 2 3 2 3 3 4 2 3 3 4 3 4 4 5
       2 3 3 4 3 4 4 5 3 4 4 5 4 5 5 6
       2 3 3 4 3 4 4 5 3 4 4 5 4 5 5 6
       3 4 4 5 4 5 5 6 4 5 5 6 5 6 6 7
       1 2 2 3 2 3 3 4 2 3 3 4 3 4 4 5
       2 3 3 4 3 4 4 5 3 4 4 5 4 5 5 6
       2 3 3 4 3 4 4 5 3 4 4 5 4 5 5 6
       3 4 4 5 4 5 5 6 4 5 5 6 5 6 6 7
       2 3 3 4 3 4 4 5 3 4 4 5 4 5 5 6
       3 4 4 5 4 5 5 6 4 5 5 6 5 6 6 7
       3 4 4 5 4 5 5 6 4 5 5 6 5 6 6 7
       4 5 5 6 5 6 6 7 5 6 6 7 6 7 7 8] at: anInt + 1

    "Evaluate this expression to form above byte array:
    ((0 to: 255)
        collect: [:i | 
            | bitCount n |
            n := i.
            bitCount := 0.
            [n = 0]
                whileFalse:
                    [bitCount := bitCount + 1.
                    n := n bitAnd: n - 1].
            bitCount]
        as: ByteArray)"