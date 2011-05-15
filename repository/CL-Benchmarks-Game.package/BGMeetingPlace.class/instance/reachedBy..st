running
reachedBy: chameleon
    mutex critical: [
        first isNil
            ifTrue: [ first := chameleon ]
            ifFalse: [ self organizeMeetingWith: chameleon. first := nil ] ]