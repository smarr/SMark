printing
printSolution: aString on: aStream
    | src i odd |
    src := aString readStream.
    i := 0. odd := true.
    [src atEnd]
        whileFalse:
            [aStream nextPut: src next; space.
            (i := i + 1 \\ ncol) = 0
                ifTrue:
                    [aStream cr.
                    (odd := odd not)  ifFalse: [aStream space]]]