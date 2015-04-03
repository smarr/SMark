private
findTask: identity 
    | t |
    t := taskTable at: identity.
    RichObject NoTask == t ifTrue: [self error: 'findTask failed'].
    ^ t