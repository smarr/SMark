benchmarks
maxPfannkuchenTo: output
   | max permutation checksum permCount flipsCount |
   max := 0.
   permCount := 0.
   checksum := 0.
   [self atEnd] whileFalse:
      [permutation := self next.
      permCount := permCount + 1.
      (permCount = 1048576) ifTrue: [permCount := 0].
      flipsCount := self pfannkuchen: permutation.
      checksum := permCount odd ifTrue: [checksum+flipsCount] ifFalse: [checksum-flipsCount].
      max := max max: flipsCount].
   output print: checksum; cr.
   ^max