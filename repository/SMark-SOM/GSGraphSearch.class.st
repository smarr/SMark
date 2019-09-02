Class {
	#name : #GSGraphSearch,
	#superclass : #SMarkSuite,
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
	#category : 'SMark-SOM-GraphSearch'
}

{ #category : #constants }
GSGraphSearch class >> ExpectedNoOfNodes [
	^ 3000000
]

{ #category : #constants }
GSGraphSearch class >> ExpectedTotalCost [
	^ 26321966
]

{ #category : #constants }
GSGraphSearch class >> MaxInitEdges [
	^ 4
]

{ #category : #constants }
GSGraphSearch class >> MaxNodes [ 
	^ 1 << 31
]

{ #category : #constants }
GSGraphSearch class >> MaxWeight [
	^ 1
]

{ #category : #constants }
GSGraphSearch class >> MinEdges [
	^ 2

]

{ #category : #constants }
GSGraphSearch class >> MinNodes [
	^ 20
]

{ #category : #constants }
GSGraphSearch class >> MinWeight [
	^ 1
]

{ #category : #benchmarking }
GSGraphSearch >> benchGraphSearch [
    | noOfNodes |
    SJenkinsRandom seed: 49734321.
    noOfNodes := GSGraphSearch ExpectedNoOfNodes / 1000 * self problemSize.

    self initializeGraph: noOfNodes.
    self breadthFirstSearch: noOfNodes.
    ^ cost
]

{ #category : #helper }
GSGraphSearch >> breadthFirstSearch: noOfNodes [
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
GSGraphSearch >> initializeGraph: noOfNodes [
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
      noOfEdges := (SJenkinsRandom random
                       rem: GSGraphSearch MaxInitEdges - GSGraphSearch MinEdges + 1) abs
                   + GSGraphSearch MinEdges.
      1 to: noOfEdges do: [:j |
        | nodeId weight |
        nodeId := (SJenkinsRandom random rem: noOfNodes) abs + 1.
        weight := (SJenkinsRandom random rem: (
                    GSGraphSearch MaxWeight - GSGraphSearch MinWeight + 1)) abs
                  + GSGraphSearch MinWeight.
        (graph at: i)      append: (GSEdge newWith: nodeId and: weight).
        (graph at: nodeId) append: (GSEdge newWith:      i and: weight).
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
GSGraphSearch >> verifyGraphSearch: result [
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
]
