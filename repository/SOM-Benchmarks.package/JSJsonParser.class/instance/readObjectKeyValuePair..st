parsing-private
readObjectKeyValuePair: object
    | name |
    self skipWhiteSpace.
    name := self readName.
    self skipWhiteSpace.
  
    (self readChar: ':') ifFalse: [ self expected: ':' ].
  
    self skipWhiteSpace.
  
    object add: name with: self readValue.
  
    self skipWhiteSpace