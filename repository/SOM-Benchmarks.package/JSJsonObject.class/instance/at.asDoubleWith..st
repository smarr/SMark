accessing
at: name asDoubleWith: default
    | value |
    value := self at: name.
    value
      ifNil:    [ ^ default ]
      ifNotNil: [ ^ value asDouble ]