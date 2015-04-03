parsing-private
readStringInternal
    | string |
    self read.
    self startCapture.
    
    [current = '"'] whileFalse: [
      current = '\\' ifTrue: [
        self pauseCapture.
        self readEscape.
        self startCapture.
      ] ifFalse: [
        "if (current < 0x20) { throw expected('valid string character'); }"
        "we currently don't have a way to get the ordinal value for a character"
        "} else {"
        self read.
      ]
    ].
    string := self endCapture.
    self read.
    ^ string