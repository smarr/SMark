accessing
indexOf: name
    | idx |
    idx := table at: name.    
    idx ~= -1 & name = (names at: idx) ifTrue: [ ^ idx ].
    ^ names lastIndexOf: name