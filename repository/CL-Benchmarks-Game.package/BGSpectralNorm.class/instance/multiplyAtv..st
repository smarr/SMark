helper
multiplyAtv: arr
   | n atv sum |
   n := arr size.
   atv := Array new: n.
   1 to: n do: [:i|
      sum := 0.0d0.
      1 to: n do: [:j|
         sum := sum + ((self matrixA: i and: j) * (arr at: j)) ].
      atv at: i put: sum].
   ^atv