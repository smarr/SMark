benchmarking
benchStone
	"modified by nishis"
	| n nTests times stones printA printC param time0 expln block time stone geoMean gm power problemSize |
	
	self error: 'here we need support for a problem size in the runner/whatever/framework'.
	n := problemSize asInteger.	 "Each test is repeated this many times. The smopstone times in
			the test parameters are normalized to a value of one. You may
			set it to a higher number if your machine is really blazing."
	output
		cr;
		cr;
		nextPutAll: 'Starting benchmarks with repetition count = ' , n printString , '.'.
	nTests := testParams size.
	nTests = testBlocks size
		ifFalse: [ self error: 'Inconsistent test count.' ].
	times := OrderedCollection new.
	stones := OrderedCollection new.	"The following blocks are restricted to two args by ST/V-DOS."
	printA := [ :time1 :smop1 | 
	output cr.
	output nextPutAll: time1 printString.
	output nextPutAll: '     '.
	output nextPutAll: smop1 printString.
	output nextPutAll: '     ' ].
	printC := [ :expln1 | output nextPutAll: expln1 ].
	output
		nextPutAll:
			'

time in    smop-
seconds    stones    explanation
'.
	1 to: nTests do: [ :i | 
		param := testParams at: i.
		time0 := param at: 1.	"seconds for one-smopstone machine"
		expln := param at: 2.
		block := testBlocks at: i.
		time := Time millisecondsToRun: [ n timesRepeat: block ].
		time := (time max: 1) / 1000.0.	"time is now in seconds"
		stone := n * time0 / time.
		times add: time.
		stones add: stone.
		printA value: time value: stone.
		printC value: expln ].
	geoMean := [ :numbers | 
	gm := 1.
	power := 1 / nTests.
	numbers do: [ :number | gm := gm * (number raisedTo: power) ].
	gm ].
	output cr.
	printA value: (geoMean value: times) value: (geoMean value: stones).
	printC value: 'geometric mean'.
	IsSupportRecursiveBlock
		ifFalse: [ output nextPutAll: '*' ].
	output
		cr;
		cr;
		nextPutAll: 'Benchmarks complete.';
		cr.
	IsSupportRecursiveBlock
		ifFalse: [ 
			output
				cr;
				nextPutAll:
						'*** Caution ***
2 test of this benchmark (marked at ''*'') is intended to test the efficiency 
of recursively calling a block, that it isn''t supported by this VM.
So the result would be fairly pointless.';
				cr ]