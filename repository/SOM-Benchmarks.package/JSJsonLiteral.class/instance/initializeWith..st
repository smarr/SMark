initialization
initializeWith: val
    value   := val.
    isNull  := 'null'  = val.
    isTrue  := 'true'  = val.
    isFalse := 'false' = val.