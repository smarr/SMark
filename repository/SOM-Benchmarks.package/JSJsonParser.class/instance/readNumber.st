parsing-private
readNumber
    | firstDigit |
    self startCapture.
    self readChar: '-'.
    firstDigit := current.
    
    self readDigit ifFalse: [ self expected: 'digit' ].
    firstDigit ~= '0' ifTrue: [ [self readDigit] whileTrue: []].
        
    self readFraction.
    self readExponent.
    ^ JSJsonNumber new: self endCapture