parsing-private
readArray
    | array |
    self read.
    array := JSJsonArray new.
    
    "Array might be empty"
    self skipWhiteSpace.
    (self readChar: ']') ifTrue: [
      ^ array
    ].
    
    self readArrayElement: array.
    [self readChar: ','] whileTrue: [
      self readArrayElement: array.
    ].

    (self readChar: ']') ifFalse: [
      self expected: '"," or "]"'
    ].
    ^ array