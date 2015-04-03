parsing-private
readRequiredChar: ch
    (self readChar: ch) ifFalse: [
      self expected: 'character: ' + ch
    ]