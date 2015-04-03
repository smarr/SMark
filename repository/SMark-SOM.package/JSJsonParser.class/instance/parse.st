parsing
parse
    | result |
    exceptionBlock := [:ex | ^ ex ].
    self read.
    self skipWhiteSpace.
    result := self readValue.
    self skipWhiteSpace.
    self isEndOfText ifFalse: [ self error: 'Unexpected character'].
    ^ result