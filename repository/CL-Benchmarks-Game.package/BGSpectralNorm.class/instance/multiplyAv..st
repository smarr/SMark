helper
multiplyAv: arr
   | n av sum |
   n := arr size.
   av := arrayFactory new: n.
   1 to: n do: [:i|
      sum := 0.0d0.
      1 to: n do: [:j|
         sum := sum + ((self matrixA: j and: i) * (arr at: j)) ].
      av at: i put: sum].
   ^av