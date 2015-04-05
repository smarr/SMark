error handling
error: message
    'error:' print.
    message print.
    ':' print.
    line print.
    column println.
    exceptionBlock value: (JSParseException with: message at: index
                                          line: line    column: column )
  