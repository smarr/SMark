accessing
at: name putString: value
    self at: name put: (JSJsonValue string: value)