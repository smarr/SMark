accessing
at: name
    | idx |
    name ifNil: [ self error: 'name is null'  ].
    idx := self indexOf: name.
    idx = -1
      ifTrue:  [ ^ nil ]
      ifFalse: [ ^ values at: idx ]