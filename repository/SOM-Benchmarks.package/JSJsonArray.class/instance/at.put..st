accessing
at: index put: value
    value ifNil: [ self error: 'value is null' ].
    values at: index put: value