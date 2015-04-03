parsing-private
readFalse
    self read.
    self readRequiredChar: 'a'.
    self readRequiredChar: 'l'.
    self readRequiredChar: 's'.
    self readRequiredChar: 'e'.
    ^ JSJsonLiteral FALSE