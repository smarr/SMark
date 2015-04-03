parsing-private
skipWhiteSpace
    [ self isWhiteSpace ]
      whileTrue:
        [ self read ].