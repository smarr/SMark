benchmarking
benchGraphSearch
    | noOfNodes |
    SJenkinsRandom seed: 49734321.
    noOfNodes := GSGraphSearch ExpectedNoOfNodes / 1000 * self problemSize.

    self initializeGraph: noOfNodes.
    self breadthFirstSearch: noOfNodes.
    ^ cost