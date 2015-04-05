adding
add: name with: aJsonValue
    name ifNil: [ self error: 'name is null'  ].
    aJsonValue ifNil: [ self error: 'aJsonValue is null' ].

    names  add: name.
    values add: aJsonValue.
    table at: name put: names size.