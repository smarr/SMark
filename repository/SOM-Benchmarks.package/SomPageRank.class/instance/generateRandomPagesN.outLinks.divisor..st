pageranking
generateRandomPagesN: n outLinks: outLinks divisor: divisor
    " generates an array of random pages and their links "
    | pages |
    " matrix cell i,j means link from j->i "
    pages := Array new: n * n withAll: 0.
    
    0 to: n - 1 do: [:i |
      outLinks at: i + 1 put: 0.

      0 to: n - 1 do: [:j |
        (i ~= j and: [(SomJenkinsRandom random abs % divisor) = 0]) ifTrue: [
          pages at: (i * n + j) + 1 put: 1.
          outLinks at: i + 1 put: (outLinks at: i + 1) + 1
        ]
      ].

    " the case with no outlinks is afunctioned "
    (outLinks at: i + 1) = 0 ifTrue: [
        | k |
        k := SomJenkinsRandom random abs % n.
        [i = k] whileTrue: [
          k := SomJenkinsRandom random abs % n.
        ].

        pages at: (i * n + k) + 1 put: 1.
        outLinks at: i + 1 put: 1
      ]
    ].
    ^ pages