removing
remove: name
    | idx |
    name ifNil: [ self error: 'name is null' ].
    idx := self indexOf: name.
    idx = -1 ifFalse: [
      table  remove: name.
      names  remove: idx.
      values remove: idx.
    ].