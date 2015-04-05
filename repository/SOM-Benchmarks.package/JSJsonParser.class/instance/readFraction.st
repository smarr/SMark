parsing-private
readFraction
    (self readChar: '.') ifFalse: [ ^ false ].
    
    self readDigit ifFalse: [ self expected: 'digit' ].
    
    [self readDigit] whileTrue: [].

    ^ true