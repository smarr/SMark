cache
forFasta: anInteger
	" This will throw an error if the cache is not initialized properly."
    ^ cache at: anInteger ifAbsentPut: [Error signal: 'Cache not properly initialized for given problem size.'].