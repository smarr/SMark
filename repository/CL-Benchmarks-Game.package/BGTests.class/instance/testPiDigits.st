tests
testPiDigits
    | piDigits27 |
    piDigits27 := #(3 1 4 1 5 9 2 6 5 3
                  5 8 9 7 9 3 2 3 8 4
                  6 2 6 4 3 3 8).

    self assert: piDigits27 equals: (BGPiDigits piDigits: 27)