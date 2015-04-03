parsing-private
readTrue
    self read.
    self readRequiredChar: 'r'.
    self readRequiredChar: 'u'.
    self readRequiredChar: 'e'.
    ^ JSJsonLiteral TRUE