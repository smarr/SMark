benchmarking
innerBenchmarkLoop
    SomJenkinsRandom seed: 49734321.
    "standard for verification"
    "n := 5000
     iter    := 10.
     thresh  := 0.00000001.
     divisor := 100000."
    ^ self verifyResult: (self runPageRankN: innerIterations iter: 10 thresh: 0.00000001 divisor: 100000).
