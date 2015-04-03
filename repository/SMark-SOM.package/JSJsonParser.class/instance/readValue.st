parsing-private
readValue
    current = 'n' ifTrue: [ ^ self readNull   ].
    current = 't' ifTrue: [ ^ self readTrue   ].
    current = 'f' ifTrue: [ ^ self readFalse  ].
    current = '"' ifTrue: [ ^ self readString ].
    current = '[' ifTrue: [ ^ self readArray  ].
    current = '{' ifTrue: [ ^ self readObject ].
    
    "Is this really the best way to write this?, or better #or:?,
     but with all the nesting, it's just ugly."
    current = '-' ifTrue: [ ^ self readNumber ].
    current = '0' ifTrue: [ ^ self readNumber ].
    current = '1' ifTrue: [ ^ self readNumber ].
    current = '2' ifTrue: [ ^ self readNumber ].
    current = '3' ifTrue: [ ^ self readNumber ].
    current = '4' ifTrue: [ ^ self readNumber ].
    current = '5' ifTrue: [ ^ self readNumber ].
    current = '6' ifTrue: [ ^ self readNumber ].
    current = '7' ifTrue: [ ^ self readNumber ].
    current = '8' ifTrue: [ ^ self readNumber ].
    current = '9' ifTrue: [ ^ self readNumber ].
    
    "else"
    self expected: 'value'