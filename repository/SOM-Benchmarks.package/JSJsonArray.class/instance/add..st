adding
add: value
    value ifNil: [ self error: 'value is null' ].
    values add: value