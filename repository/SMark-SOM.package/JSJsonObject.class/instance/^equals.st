comparing
= other
    self == other ifTrue: [ ^ true  ].
    self == nil   ifTrue: [ ^ false ].
    self class == other class ifFalse: [ ^ false ].
    
    ^ names = other names & values = other values