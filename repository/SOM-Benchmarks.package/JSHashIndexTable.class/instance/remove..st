removing
remove: index
    1 to: hashTable size do: [:i |
      index + 1 = (hashTable at: i)
        ifTrue:  [ hashTable at: i put: 0 ]
        ifFalse: [ 
          (hashTable at: i) > index + 1 ifTrue: [
            hashTable at: i put: (hashTable at: i) - 1]]]