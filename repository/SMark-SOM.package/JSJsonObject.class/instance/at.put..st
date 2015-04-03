accessing
at: name put: aJsonValue
    | idx |
    name ifNil: [ self error: 'name is null'  ].
    aJsonValue ifNil: [ self error: 'aJsonValue is null' ].
  
    idx := self indexOf: name.
    idx <> -1
      ifTrue:  [values at: idx put: aJsonValue]
      ifFalse: [
        names  append: name.
        values append: aJsonValue.
        table at: name put: names size.
      ].