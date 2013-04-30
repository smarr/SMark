initialize-release
fromString: aString
    | rawString |
    rawString := aString reject: [:e | e isSeparator].
    ncell := rawString size.
    ncol := 0.
    (aString readStream upTo: Character cr) do: [:e | e isSeparator ifFalse: [ncol := ncol + 1]].
    twoRows := ncol * 2.
    sixRows := ncol * 6.
    self initializeRowColMasks.
    pieces := (setFactory withAll: rawString) sorted collect: [:char |
        self shiftSEmost:
            (rawString inject: 0 into: [:pmask :c | pmask * 2 + (c = char ifTrue: [1] ifFalse: [0])])].
    self initializePossiblePositions