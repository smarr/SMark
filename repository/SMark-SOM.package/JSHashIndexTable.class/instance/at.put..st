accessing
at: name put: index
    | slot |
    slot := self hashSlotFor: name.
    
    index < 255
      ifTrue:  [ hashTable at: slot put: index + 1 ]
      ifFalse: [ hashTable at: slot put: 0 ]