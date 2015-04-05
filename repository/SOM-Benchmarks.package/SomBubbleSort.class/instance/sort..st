sorting
sort: array
        array size to: 1 by: -1 do: [ :i |
            1 to: i - 1 do: [ :j |
                | current next |
                current := array at: j.
                next    := array at: j + 1.
                (current > next)
                    ifTrue: [
                        array at: j put: next.
                        array at: j + 1 put: current ] ] ].
        ^ array