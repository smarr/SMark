accessing
at: name asStringWith: default
    | value |
    value := self at: name.
    value
      ifNil:    [ ^ default ]
      ifNotNil: [ ^ value asString ]