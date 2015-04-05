helper
breadthFirstSearch: noOfNodes
    | stop |
    stop := true.
    [stop] whileTrue: [
      stop := false.
      
      1 to: noOfNodes do: [:tid |
        (graphMask at: tid) ifTrue: [
          graphMask at: tid put: false.
          (graphNodes at: tid) starting 
              to: ((graphNodes at: tid) noOfEdges + (graphNodes at: tid) starting) - 1
              do: [:i |
            | id |
            id := graphEdges at: i.
            (graphVisited at: id) ifFalse: [
              cost at: id put: (cost at: tid) + 1.
              updatingGraphMask at: id put: true.
            ]
          ]
        ]
      ].
      
      1 to: noOfNodes do: [:tid |
        (updatingGraphMask at: tid) ifTrue: [
          graphMask    at: tid put: true.
          graphVisited at: tid put: true.
          stop := true.
          updatingGraphMask at: tid put: false
        ]
      ]
    ]