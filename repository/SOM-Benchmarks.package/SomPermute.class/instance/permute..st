benchmarking
permute: n
        count := count + 1.
        (n ~= 0)
            ifTrue: [
                self permute: n - 1.
                n to: 1 by: -1 do: [ :i |
                    self swap: n with: i.
                    self permute: n - 1.
                    self swap: n with: i ] ]