accessing
at: name asBooleanWith: default
    | value |
    value := self at: name.
    value
      ifNil:    [ ^ default ]
      ifNotNil: [ ^ value asBoolean ]