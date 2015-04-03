benchmarking
verifyGraphSearch: result
    | totalCost |
    cost length = (GSGraphSearch ExpectedNoOfNodes / 1000 * self problemSize)
      ifFalse: [ ^ false ].

    totalCost := 0.    
    cost do: [:c | totalCost := totalCost + c].

    cost length = GSGraphSearch ExpectedNoOfNodes
      ifTrue:  [
        totalCost = GSGraphSearch ExpectedTotalCost ifFalse: [
          self error: 'ERROR: the total cost obtained for ', cost length asString,
              ' nodes is ', totalCost asString, ' while the expected cost is ',
              GSGraphSearch ExpectedTotalCost 
        ]]
      ifFalse: [
        firstCost == nil
          ifTrue: [
            firstCost := totalCost.
            ^ true ]
          ifFalse: [
            ^ firstCost = totalCost
          ]
      ].

    ^ true