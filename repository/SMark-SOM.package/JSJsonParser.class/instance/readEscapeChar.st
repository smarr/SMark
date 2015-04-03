parsing-private
readEscapeChar
    current = '"'  ifTrue: [ ^ '"'  ].
    current = '/'  ifTrue: [ ^ '/'  ].
    current = '\\' ifTrue: [ ^ '\\' ].

    current = 'b'  ifTrue: [ ^ '\b'  ].
    current = 'f'  ifTrue: [ ^ '\f'  ].
    current = 'n'  ifTrue: [ ^ '\n'  ].
    current = 'r'  ifTrue: [ ^ '\r'  ].
    current = 't'  ifTrue: [ ^ '\t'  ].

    "TODO: SOM doesn't have a way to create unicode characters."
    self expected: 'valid escape sequence. note, some are not supported'
