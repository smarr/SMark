benchmarks
pfannkuchen: anArray
   | first complement a b k |
   k := 0.
   [ (first := anArray at: 1) == 1 ] whileFalse: [
      k := k + 1.
      complement := first + 1.
      1 to: first // 2 do: [ :i |
         a := anArray at: i.
         b := anArray at: complement - i.
         anArray at: i put: b.
         anArray at: complement - i put: a.
      ]
   ].
   ^k