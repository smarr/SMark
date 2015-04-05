accessing
at: name asIntegerWith: default
    | value |
    value := self at: name.
    value
      ifNil:    [ ^ default ]
      ifNotNil: [ ^ value asInteger ]