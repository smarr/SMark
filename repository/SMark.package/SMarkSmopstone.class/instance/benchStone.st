benchmarking
benchStone
	| n primes strings set |
	
	n := self problemSize.
	
	1 to: n do: [:i | self fractonacci: 5/2            ]. "13/2"
	1 to: n do: [:i | primes := self primesUpTo: 1000   ]. "7351 - 1" "9000"
	1 to: n do: [:i | self streamTestsOn: primes        ].
	1 to: n do: [:i | strings := self stringsUpTo: 1000 ]. "8000"
	1 to: n do: [:i | set := self setFrom: strings      ].
	1 to: n do: [:i | self sort: set                    ].
	1 to: n do: [:i | self sorcerersApprentice          ].