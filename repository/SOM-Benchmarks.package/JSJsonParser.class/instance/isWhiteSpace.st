testing
isWhiteSpace
    current = ' '  ifTrue: [^ true].
    current = '\t' ifTrue: [^ true].
    current = '\n' ifTrue: [^ true].
    current = '\r' ifTrue: [^ true].
    ^ false