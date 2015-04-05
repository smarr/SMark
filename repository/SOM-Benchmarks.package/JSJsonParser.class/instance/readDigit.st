parsing-private
readDigit
    self isDigit ifFalse: [ ^ false ].
    self read.
    ^ true