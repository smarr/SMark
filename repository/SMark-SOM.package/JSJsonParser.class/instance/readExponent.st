parsing-private
readExponent
    ((self readChar: 'e') not and: [
      (self readChar: 'E') not]) ifTrue: [ ^ false ].
    
    
    (self readChar: '+') ifFalse: [ self readChar: '-' ].
    
    self readDigit ifFalse: [ self expected: 'digit' ].

    [self readDigit] whileTrue: [].

    ^ true