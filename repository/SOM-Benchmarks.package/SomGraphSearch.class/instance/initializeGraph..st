initialization
initializeGraph: noOfNodes
    | source graph totalEdges |
    graphNodes        := Array new: noOfNodes.
    graphMask         := Array new: noOfNodes withAll: false.
    updatingGraphMask := Array new: noOfNodes withAll: false.
    graphVisited      := Array new: noOfNodes withAll: false.
    cost              := Array new: noOfNodes withAll: -1.

    source := 1.

    graph := Array new: noOfNodes.
    1 to: noOfNodes do: [:i | graph at: i put: OrderedCollection new ].

    1 to: noOfNodes do: [:i |
      | noOfEdges |
      noOfEdges := (SomJenkinsRandom random
                       rem: SomGraphSearch MaxInitEdges - SomGraphSearch MinEdges + 1) abs
                   + SomGraphSearch MinEdges.
      1 to: noOfEdges do: [:j |
        | nodeId weight |
        nodeId := (SomJenkinsRandom random rem: noOfNodes) abs + 1.
        weight := (SomJenkinsRandom random rem: (
                    SomGraphSearch MaxWeight - SomGraphSearch MinWeight + 1)) abs
                  + SomGraphSearch MinWeight.
        (graph at: i)      add: (GSEdge newWith: nodeId and: weight).
        (graph at: nodeId) add: (GSEdge newWith:      i and: weight).
      ]
    ].

    totalEdges := 0.
    1 to: noOfNodes do: [:i |
      | noOfEdges |
      noOfEdges := (graph at: i) size.
      graphNodes at: i put: (GSNode newWith: totalEdges + 1 and: noOfEdges).
      totalEdges := totalEdges + noOfEdges
    ].

    graphMask    at: source put: true.
    graphVisited at: source put: true.

    graphEdges := Array new: totalEdges withAll: 0.
    
    k := 1.
    graph do: [:i |
      i do: [:j |
        graphEdges at: k put: j dest.
        k := k + 1.
      ]
    ].
    cost at: source put: 0.