private
release: identity 
    | t |
    t := self findTask: identity.
    RichObject NoTask == t ifTrue: [ ^ RichObject NoTask ].
    t taskHolding: false.
    t priority > currentTask priority
		ifTrue: [ ^ t ]
		ifFalse: [ ^ currentTask ]