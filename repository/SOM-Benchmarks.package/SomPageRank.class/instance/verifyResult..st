benchmarking
verifyResult: pageRanks
    innerIterations = 5000 " and: [iter = 10 and: [thresh = 0.00000001 and: [divisor = 100000]]]"
      ifTrue: [
        | exp |
        exp := SomPageRank ExpectedPageRanks.
        pageRanks size = exp size ifFalse: [
          self error: 'Invalid length of page_ranks array'
        ].
      
        1 to: pageRanks size do: [:i | 
          (pageRanks at: i) = (exp at: i) ifFalse: [
            self error: 'ERROR: page_ranks[' + i asString + ']=' +
                        (pageRanks at: i) + ' differs from the expected value: ' +
                        (exp at: i)
          ]
        ] ]
      ifFalse: [
        ^ self checkBasedOnFirstResult: pageRanks
      ].
    ^ true