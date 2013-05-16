benchmarking
benchStone
	| n primes strings set |
	
	n := self problemSize.
	
	self fractonacci: n / 13. "13/2"
	
	primes := self primesUpTo: n * 100. "7351 - 1" "9000"
	self streamTestsOn: primes.
	
	strings := self stringsUpTo: n * 100. "8000"
	set := self setFrom: strings.
	self sort: set.
	
	self sorcerersApprentice: n.