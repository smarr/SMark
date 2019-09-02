Class {
	#name : #SomGraphSearch,
	#superclass : #SomBenchmark,
	#instVars : [
		'graphNodes',
		'graphMask',
		'updatingGraphMask',
		'graphVisited',
		'cost',
		'graphEdges',
		'k',
		'firstCost'
	],
	#category : 'SOM-Benchmarks-GraphSearch'
}

{ #category : #constants }
SomGraphSearch class >> ExpectedNoOfNodes [
	^ 3000000
]

{ #category : #constants }
SomGraphSearch class >> ExpectedTotalCost [
	^ 26321966
]

{ #category : #constants }
SomGraphSearch class >> MaxInitEdges [
	^ 4
]

{ #category : #constants }
SomGraphSearch class >> MaxNodes [ 
	^ 1 << 31
]

{ #category : #constants }
SomGraphSearch class >> MaxWeight [
	^ 1
]

{ #category : #constants }
SomGraphSearch class >> MinEdges [
	^ 2

]

{ #category : #constants }
SomGraphSearch class >> MinNodes [
	^ 20
]

{ #category : #constants }
SomGraphSearch class >> MinWeight [
	^ 1
]

{ #category : #helper }
SomGraphSearch >> breadthFirstSearch: noOfNodes [
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
]

{ #category : #initialization }
SomGraphSearch >> initializeGraph: noOfNodes [
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
]

{ #category : #benchmarking }
SomGraphSearch >> innerBenchmarkLoop [
    | noOfNodes |
    SomJenkinsRandom seed: 49734321.
    noOfNodes := SomGraphSearch ExpectedNoOfNodes / 1000 * innerIterations.

    self initializeGraph: noOfNodes.
    self breadthFirstSearch: noOfNodes.
    ^ self verifyResult: cost
]

{ #category : #benchmarking }
SomGraphSearch >> verifyResult: result [
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
]
