pageranking
runPageRankN: n iter: iter thresh: thresh divisor: divisor
    | nbLinks maxDiff pageRanks maps outLinks t pages |
    maxDiff   := Float infinity.
    pageRanks := Array new: n     withAll: 1.0 / n.
    maps      := Array new: n * n withAll: 0.0.
    outLinks  := Array new: n     withAll: 0.

    pages := self generateRandomPagesN: n outLinks: outLinks divisor: divisor.

    nbLinks := 0.
    0 to: n - 1 do: [:i |
      1 to: n do: [:j |
        nbLinks := nbLinks + (pages at: i * n + j)
      ]
    ].

    t := 1.
    [t <= iter and: [maxDiff >= thresh]] whileTrue: [
      self mapPageRanks: pages pageRanks: pageRanks maps: maps outLinks: outLinks n: n.
      maxDiff := self reducePageRanks: pageRanks maps: maps n: n.
      t := t + 1
    ].
    
    ^ pageRanks