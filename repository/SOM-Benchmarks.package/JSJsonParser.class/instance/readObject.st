parsing-private
readObject
    | object |
    self read.
    object := JSJsonObject new.
    self skipWhiteSpace.

    (self readChar: '}') ifTrue: [
      ^ object
    ].
    
    self readObjectKeyValuePair: object.
    [self readChar: ','] whileTrue: [
      self readObjectKeyValuePair: object.
    ].
    
    (self readChar: '}') ifFalse: [
      self expected: '"," or "}"'
    ].
    
    ^ object