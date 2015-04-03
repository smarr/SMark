parsing-private
readNull
    self read.
    self readRequiredChar: 'u'.
    self readRequiredChar: 'l'.
    self readRequiredChar: 'l'.
    ^ JSJsonLiteral NULL