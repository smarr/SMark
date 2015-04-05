benchmarking
verifyResult: result
    | totalCost |
    cost size = (SomGraphSearch ExpectedNoOfNodes // 1000 * innerIterations)
      ifFalse: [ ^ false ].

    totalCost := 0.    
    cost do: [:c | totalCost := totalCost + c].

    cost size = SomGraphSearch ExpectedNoOfNodes
      ifTrue:  [
        totalCost = SomGraphSearch ExpectedTotalCost ifFalse: [
          self error: 'ERROR: the total cost obtained for ', cost length asString,
              ' nodes is ', totalCost asString, ' while the expected cost is ',
              SomGraphSearch ExpectedTotalCost 
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