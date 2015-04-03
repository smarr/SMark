parsing-private
readArrayElement: array
    self skipWhiteSpace.
    array add: self readValue.
    self skipWhiteSpace.