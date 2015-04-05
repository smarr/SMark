benchmarking
benchmark
        | result |
        result := true.
        1 to: 10 do: [ :i | result := result and: self queens ].
        ^ result