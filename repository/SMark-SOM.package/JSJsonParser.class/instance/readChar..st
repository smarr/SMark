parsing-private
readChar: ch
    current = ch ifFalse: [ ^ false ].
    self read.
    ^ true