benchmarking
innerBenchmarkLoop
		| result |
      self initialize: innerIterations.
      result := self maxPfannkuchen.
      ^ result = (SomFannkuch expectedResult: innerIterations)