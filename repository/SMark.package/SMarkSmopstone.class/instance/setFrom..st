stone benchmarks
setFrom: collection
	"Form a set from collection and return it.

	This method tests the efficiency of building a fairly large set
	from strings. It indirectly tests the effectiveness of the string
	hash function. Strings are used often enough as dictionary keys
	that this may be worth including in the benchmark suite.  ST/V-DOS
	has a primitive hash for strings, and ST80 has an elaborate one
	written in Smalltalk."

	^collection asSet