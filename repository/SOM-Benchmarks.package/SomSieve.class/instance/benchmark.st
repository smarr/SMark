benchmarking
benchmark
        | flags |
        flags  := Array new: 5000.
        ^ self sieve: flags size: 5000.