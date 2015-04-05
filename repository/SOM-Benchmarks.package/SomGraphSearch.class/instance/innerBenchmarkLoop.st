benchmarking
innerBenchmarkLoop
    | noOfNodes |
    SomJenkinsRandom seed: 49734321.
    noOfNodes := SomGraphSearch ExpectedNoOfNodes / 1000 * innerIterations.

    self initializeGraph: noOfNodes.
    self breadthFirstSearch: noOfNodes.
    ^ self verifyResult: cost