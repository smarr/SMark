parsing-private
readName
    current = '"' ifFalse: [ self expected: 'name' ].
    ^ self readStringInternal