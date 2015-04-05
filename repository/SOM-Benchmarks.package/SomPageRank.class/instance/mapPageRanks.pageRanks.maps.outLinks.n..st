pageranking
mapPageRanks: pages pageRanks: pageRanks maps: maps outLinks: outLinks n: n
    0 to: n - 1 do: [:i |
      | outboundRank |
      outboundRank := (pageRanks at: i + 1) / (outLinks at: i + 1).
      
      0 to: n - 1 do: [:j |
        maps at: (i * n + j) + 1
            put: ((pages at: (i * n + j) + 1) = 0
                   ifTrue:  [0.0]
                   ifFalse: [(pages at: (i * n + j) + 1) * outboundRank])
      ]
    ]