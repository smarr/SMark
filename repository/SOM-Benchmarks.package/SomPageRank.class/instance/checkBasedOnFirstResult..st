pageranking
checkBasedOnFirstResult: pageRanks
    pageRanks size = innerIterations ifFalse: [ ^ false ].

    firstResult == nil ifTrue: [
      firstResult := pageRanks.
      ^ true
    ] ifFalse: [
      1 to: innerIterations do: [:i |
        (firstResult at: i) = (pageRanks at: i) ifFalse: [
          ^ false
        ]
      ]
    ].
    
    ^ true