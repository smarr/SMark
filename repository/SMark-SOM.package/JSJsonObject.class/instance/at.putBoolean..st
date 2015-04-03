accessing
at: name putBoolean: value
    self at: name put: (JSJsonValue boolean: value)