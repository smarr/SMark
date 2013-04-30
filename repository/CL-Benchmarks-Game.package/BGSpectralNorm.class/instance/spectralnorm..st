benchmark
spectralnorm: n
   | u v vBv vv |
   u := arrayFactory new: n withAll: 1.0d0.
   10 timesRepeat:
      [v := self multiplyAtAv: u.
       u := self multiplyAtAv: v].
   vBv := 0.0d0.
   vv := 0.0d0.
   1 to: n do:
      [:i |
       vBv := vBv + ((u at: i) * (v at: i)).
       vv := vv + ((v at: i) * (v at: i))].
   ^ (vBv / vv) sqrt