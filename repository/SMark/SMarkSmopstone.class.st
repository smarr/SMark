"
modified for Squeak by nishis@urban.ne.jp
see the comment of SlopstoneBenchmark class.
I added all class methods and initialization>initilize method,
modified:
	streamTestsOn: method.  In some case use testPrintOn: s base: instead of printOn:,
	primesUpTo: method. From recursively calling a block to whileTrue: block.
	sorcerersApprentice method. From recursively calling a block to  recursive method.
	execute and setup method.
Thanx to Mr. Tim Olson, Mr. Kohler Markus, Mr. Tim Rowledge, Mr. John Maloney, Mr. Ian Piumarta.

originak code by
	NAME			STones80
	AUTHOR			bruce@utafll.uta.edu (Bruce Samuelson)
	FUNCTION		low and medium level benchmarks for ST80 and ST/V
	ST-VERSIONS		pre R4.0, R4.0, R4.1, ST/V
	PREREQUISITES	need floating point hardware or emulation
	CONFLICTS		none
	DISTRIBUTION	world
	VERSION			1.0
	DATE			April 16, 1993


"
Class {
	#name : #SMarkSmopstone,
	#superclass : #SMarkSuite,
	#instVars : [
		'ordCollectionFact',
		'intervalFact',
		'rectFactory',
		'sortedColFact',
		'arrFact',
		'setFact',
		'pointFact'
	],
	#category : 'SMark-Classic'
}

{ #category : #benchmarking }
SMarkSmopstone >> benchStone [
	| n primes strings set |
	
	n := self problemSize.
	
	self fractonacci: n / 13. "13/2"
	
	primes := self primesUpTo: n * 100. "7351 - 1" "9000"
	self streamTestsOn: primes.
	
	strings := self stringsUpTo: n * 100. "8000"
	set := self setFrom: strings.
	self sort: set.
	
	self sorcerersApprentice: n.
]

{ #category : #defaults }
SMarkSmopstone >> defaultProblemSize [
	^ 80
]

{ #category : #'stone benchmarks' }
SMarkSmopstone >> fractonacci: n [ 
	"Return something like the fibonacci function of n but
	using fractional numbers rather than whole ones. The
	reason for this variation is to run long enough to get
	a decent time measurement without exceeding 16383, the
	limit of small integers for ST/V-DOS. Choosing n = 13/2
	takes enough time and computes to 13581.

	Fibonacci uses n-1 and n-2 instead of n-(1/2) and n-(1/3).
	However, I couldn't get it to run in the above constraints.

	This benchmark tests the efficiency of recursively calling
	a method that does a little fractional arithmetic internally."

	^n > 1
		ifTrue: [(self fractonacci: n - (1/2)) + (self fractonacci: n - (1/3))]
		ifFalse: [1]
]

{ #category : #'stone benchmarks' }
SMarkSmopstone >> primesUpTo: n [
	"modified by nishis"

	"Return the prime numbers between 2 and n.

	This method tests the efficiency of recursively calling a block
	that does some collection enumeration based on integer arithmetic."

	| nSqrt lowPrimes highPrimes genNext first |
	n < 5 | (n > 16363) ifTrue: [self error: 'Prime limit(s) out of range.'].
	nSqrt := n sqrt rounded.
	lowPrimes := ordCollectionFact with: 2.
	highPrimes := intervalFact from: 5 to: n by: 2.
	
	genNext := [:nextPrime |
		lowPrimes add: nextPrime.
		highPrimes := highPrimes select: [:k | k \\ nextPrime ~= 0].
		(first := highPrimes first) <= nSqrt ifTrue: [genNext value: first]].
	
	genNext value: 3.

	^ lowPrimes , highPrimes
]

{ #category : #benchmarking }
SMarkSmopstone >> problemSize [
	<omniUnenforced> "Hint for the OMOP that it is part of the meta infrastructure"
	| ps |
	ps := super problemSize.
	
	ps isInteger ifFalse: [	^ self defaultProblemSize].
		
	^ ps
]

{ #category : #benchmarking }
SMarkSmopstone >> readme [
   "STEFAN: use the original benchmarks, but do not use original way
            of reporting results. Rely on the SMark reporting instead."

	"INTRODUCTION 
	 
	Smopstone: Smalltalk Medium level OPeration Stones 
	Portable Medium level Benchmarks for ST80 and ST/V (using 16-bit 
	SmallInts) Placed in public domain January 1993  (c) Bruce Samuelson 
	Permission is given to place this in public Smalltalk archives 
	 
	Use monospaced fonts if possible to view the methods in this class. 
	 
	(1) Collect garbage if supported (2) do 'SmopstoneBenchmark new 
	runBenchmark'. Results are printed in the Transcript window. 
	Post results for your machines to comp.lang.smalltalk or 
	mail them to bruce@ling.uta.edu or bruce@utafll.uta.edu. 
	 
	DISCUSSION 
	    
	This readme method would normally be in the class comment for ST80. 
	ST/V-DOS doesn't support class comments. 
	 
	These benchmarks are a companion to the SlopstoneBenchmark class 
	posted to 
	comp.lang.smalltalk this month. Slopstones tested low level operations. 
	  
	Smopstones test medium level operations that exercise recursive block 
	and  
	method calls, collection building and enumeration, streaming, and 
	sorting. The 
	lower level operations contained in them exercise arithmetic (mostly 
	integer, with some fractions and floats) string manipulation, and low 
	level streaming. 
	 
	The benchmarks do not test applications. They also do not test user 
	interface performance because of the non-portability of this area of 
	Smalltalk and its  
	sensitivity to the speed of the video subsystem. The tests are cpu bound. 
	They do not access files and should not cause disk paging. 
	 
	The main weaknesses of the benchmarks are (1) they are not high 
	enough level 
	to test actual applications, and (2) they concentrate in too few areas of 
	Smalltalk, omitting many of the diverse capabilities of its class library. 
	My excuse is that one can only devote limited time writing public 
	domain benchmarks. 
	 
	The tests avoid generating integers larger than 16383, the maximum 
	SmallInteger in ST/V-DOS. 16-bit implementions would perform worse 
	with larger 
	integers. The benchmarks are also suitable for testing 32-bit versions of 
	Smalltalk. They try to avoid other pitfalls that would skew the results 
	such as the lack of an adequate hash function for a class. Someone 
	warned of this 
	in comp.lang.smalltalk (I forget who). 
	 
	DEFINITION OF REFERENCE MACHINE (ONE SMOPSTONE) 
	 
	The following machine is the one on which I developed these 
	benchmarks. By 
	convention it is defined to operate at one smopstone. It's a mid range 
	performer for current ParcPlace versions of Smalltalk. 
	 
	Hardware: Amax 486DX/33 (includes internal floating point processor 
	and internal 8K cache), 256K external cache, 16MB RAM. 
	 
	Software: ParcPlace VisualWorks 1.0, Windows 3.1, DOS 5.0 (plain vanilla 
	setup). 
	 
	COMPARISON TO XEROX DORADO 
	 
	For reference, the machine runs at 649% of a Dorado on ParcPlace 
	benchmarks for ST80 4.1. Its fast video card helps on these PPS 
	benchmarks. I didn't run 
	them for VisualWorks 1.0. It would be somewhat slower because there 
	are vastly 
	more classes. 
	 
	EXAMPLE RESULTS FOR REFERENCE MACHINE 
	 
	time in    smop- 
	seconds    stones    explanation 
	 
	 
	3.157      1.0       generating fractonaccis 
	1.123      1.0       generating primes 
	1.091      1.0       generating and parsing streams 
	3.091      1.0       generating strings 
	1.167      1.0       forming sets 
	5.139      1.0       sorting strings 
	5.601      1.0       sorcerer's apprentice 
	 
	2.355      1.0       geometric mean"
	^ self
]

{ #category : #'stone benchmarks' }
SMarkSmopstone >> setFrom: collection [
	"Form a set from collection and return it.

	This method tests the efficiency of building a fairly large set
	from strings. It indirectly tests the effectiveness of the string
	hash function. Strings are used often enough as dictionary keys
	that this may be worth including in the benchmark suite.  ST/V-DOS
	has a primitive hash for strings, and ST80 has an elaborate one
	written in Smalltalk."

	^ setFact withAll: collection
]

{ #category : #running }
SMarkSmopstone >> setUp [
	ordCollectionFact := OrderedCollection.
	intervalFact      := Interval.
	rectFactory       := Rectangle.
	sortedColFact     := SortedCollection.
	arrFact           := Array.
	setFact           := Set.
	pointFact         := Point.
]

{ #category : #'stone benchmarks' }
SMarkSmopstone >> sorcerersApprentice: m [
	"modified by nishis"

	" FORMATTED FOR MONOSPACED FONT

	Perform various operations on rectangles.

	This method tests the efficiency of recursively calling a block that
	includes lots of integer arithmetic, collection building, and collection
	enumeration. The method:

	(1) Creates a collection of pseudo random rectangles 
	(2) Forms a new collection of all their intersections 
	(3) Recursively continues until there are no more intersections 
	(4) Returns a collection with the counts of rectangles in each generation.

	Because the intersections are forming progressively smaller rectangles
	(we exclude intersections of a rectangle with itself), the algorithm will
	eventually converge. Depending on the choice of numeric parameters, it may
	converge very quickly or very slowly. The parameters used below make it
	converge in a reasonable amount of time (a few seconds on a one-smopstone
	machine). It took some experimentation with different combinations to
	achieve this.

	The pseudo random number generator isn't very good, but it's adequate
	for this benchmark. I had intended the number '87' it uses to be a prime,
	but 87 = 29 * 3. The numbers may have been a bit more random otherwise.

	One could write an algorithm that would converge much more quickly and in
	a more predictable amount of time by sorting the intermediate rectangles
	in two dimensions and not bothering to test for intersections those
	rectangles that are contained in mutually exclusive regions. We have
	chosen algorithmic simplicity over performance optimization. We simply
	perform intersections of each rectangle with every possible partner in
	each generation. The time consumed is quadratic in the number of rectangles.

	The algorithm originally stored rectangles in sets to eliminate duplicates.
	Unfortunately, ST/V-DOS uses the hash function inherited from Object for
	Rectangle, which will allow duplicates to be stored. So we were forced to
	store rectangles in ordered collections and eliminate duplicates by brute
	force. The brutality was heightened because we could not use the test
	collection>>includes: to decide whether to add a rectangle to the ordered
	collections, since ST/V-DOS does not define equality (=) for rectangles
	either. The remaining warts in the code are not worth explaining.

	In an actual application, these shortcomings of ST/V-DOS would have been
	overcome by adding subclasses and methods rather than writing kludgy code."

	| n firstGen intersection isIncluded counts r random
	a b c d e f g h generate nextGen |
	
	n := 20 * m.
	firstGen := ordCollectionFact new.
	counts   := ordCollectionFact new.
	r := 50.
	random := [r := r + 1 * 87 \\ n].
	m timesRepeat: [
		a := random value.
		b := random value.
		c := random value.
		d := random value.
		e := a min: b.
		f := c min: d.
		g := a max: b.
		h := c max: d.
		firstGen add: (rectFactory origin: (pointFact x: e y: f) corner: (pointFact x: g y: h))].
	generate := 
		[:lastGen |
		counts add: lastGen size.
		nextGen := ordCollectionFact new.
		lastGen do:
			[:r1 |
			lastGen do: 
				[:r2 | 
				(r1 origin ~= r2 origin or: [r1 corner ~= r2 corner])
				"In ST80 this test would have simply been r1 ~= r2"
					ifTrue:
						[(r1 intersects: r2)
							ifTrue:
								[intersection := r1 intersect: r2.
								isIncluded := false.                     "All these lines"
								nextGen do:                              "would have been"
									[:rec |                                "avoided if we"
										(rec origin = intersection origin and: "could have used"
										[rec corner = intersection corner])    "a set for"
											ifTrue: [isIncluded := true]].       "nextGen. See"
								isIncluded                               "explanation"
									ifFalse:                               "above."
										[nextGen size > 500
											ifTrue: [self error: 'Converges too slowly.']
											ifFalse: [nextGen add: intersection]]]]]].
			nextGen size > 0 ifTrue: [generate value: nextGen]].
	
	generate value: firstGen.
	^counts
]

{ #category : #'stone benchmarks' }
SMarkSmopstone >> sort: collection [
	"Form a sorted collection from collection and return it.

	This method tests the efficiency of sorting a fairly large
	collection of strings. It indirectly measures the efficiency
	of the sorting algorithm and of string comparison operations."

	^collection as: sortedColFact
]

{ #category : #'stone benchmarks' }
SMarkSmopstone >> streamTestsOn: integers [ 
	"modified by nishis"
	"Test steaming operations on the collection of integers. 
	 
	This method measures the efficiency of integer-to-float conversion, of 
	printing numbers to a write stream, of parsing tokens in a read 
	stream,   and of converting the tokens from strings to numbers. The 
	technique for 
	converting tokens into floats is constrained by portability between 
	ST80 and ST/V. 
	 
	To validate the logic, the original integers are compared with the 
	final   floats. There should be no roundoff errors."
	"The following line accounts for the different implementations of 
	Float>>printString for some versions of Smalltalk. USA versions use 
	the decimal character, while some European versions use the comma 
	char.   Thanks to Marten Feldtmann for pointing this out."

	| delim space s floats float string |
	delim := 1.0 printString at: 2.	"$. for USA, $, for some Europe."

	space := Character value: 32.
	"Can't use Character space in ST/V-DOS"
	s := ReadWriteStream on: String new.
	integers do: 
		[:i |
			i asFloat printOn: s.
			s space].
	"Now make sure the underlying string size is < 16383, a 16-bit small int."
	s contents size > (SmallInteger maxVal) ifTrue: [self error: 'String too big.'].
	s reset.
	floats := ordCollectionFact new: integers size.
	[s atEnd]
		whileFalse: 
			[float := 0.0.
			string := s upTo: delim.
			s upTo: space.
			"In the following, digitValue is portable between ST80 and ST/V-DOS. "
			string do: [:char | float := float * 10.0 + char digitValue].
			floats add: float].
	integers = floats ifFalse: [self error: 'Numbers do not compare.']
]

{ #category : #'stone benchmarks' }
SMarkSmopstone >> stringsUpTo: n [ 
	"Return a collection of strings representing the integers from 1 
	to n with their digits reversed. 
	 
	This method tests the efficiency of creating small streams, performing 
	string operations, and building collections. It includes a gross kludge 
	to coerce portability between ST80 and ST/V. They vary slightly in the 
	selector used to reverse collections. Subsequent to freezing this code, 
	someone pointed out that it could have been written more simply 
	without   using perform:. It could also have been simplified using 
	select:. It 
	was too late to change. The techniques are left as an exercise for the 
	reader."

	| selector |
	(arrFact with: #reverse with: #reversed)
		do: [:symbol | (String canUnderstand: symbol)
			ifTrue: [selector := symbol]].
	^ (intervalFact from: 1 to: n)
		collect: [:m | m printString perform: selector]
]
