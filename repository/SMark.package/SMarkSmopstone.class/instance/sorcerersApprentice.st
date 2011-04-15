benchmarking
sorcerersApprentice
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

	| m n firstGen intersection isIncluded counts r random
	a b c d e f g h generate nextGen |
	
	m := 80.
	n := 20 * m.
	firstGen := OrderedCollection new.
	counts := OrderedCollection new.
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
		firstGen add: (Rectangle origin: e @ f corner: g @ h)].
	generate := 
		[:lastGen |
		counts add: lastGen size.
		nextGen := OrderedCollection new.
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
	IsSupportRecursiveBlock
		ifTrue: [generate value: firstGen]
		ifFalse: [^ self generate: firstGen counts: counts].
	^counts