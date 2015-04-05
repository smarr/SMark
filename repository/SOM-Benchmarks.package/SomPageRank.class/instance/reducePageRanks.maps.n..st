pageranking
reducePageRanks: pageRanks maps: maps n: n
    | dif |
    dif := 0.0.

    0 to: n - 1 do: [:j |
      | oldRank newRank |
      oldRank := pageRanks at: j + 1.
      newRank := 0.0.
      
      0 to: n - 1 do: [:i |
        newRank := newRank + (maps at: (i * n + j) + 1)
      ].

      newRank := ((1 - SomPageRank DFactor) / n) + (SomPageRank DFactor * newRank).
      dif := (newRank - oldRank) abs > dif
               ifTrue: [(newRank - oldRank) abs] ifFalse: [ dif ].
      pageRanks at: j + 1 put: newRank
    ].
    ^ dif