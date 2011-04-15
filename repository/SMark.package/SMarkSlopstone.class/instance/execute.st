benchmarking
execute
	"modified by nishis"

	| n nTests iters times speeds stones scale printA printB printC param count speed0 expln block time iter speed stone geoMean gm power |
	n := self problemSize asInteger.	"Number of times each test block will be evaluated."
	n > SmallInteger maxVal
		ifTrue: [ self error: 'Count exceeded max small int.' ].
	
	nTests := testParams size.
	nTests = testBlocks size
		ifFalse: [ self error: 'Inconsistent test count.' ].
	iters := OrderedCollection new.
	times := OrderedCollection new.
	speeds := OrderedCollection new.
	stones := OrderedCollection new.
	scale := 1000.	"So iterations can be reported as 1000s of iterations"	"The following blocks are restricted to two args by ST/V-DOS."
	printA := [ :t1 :t2 | 
	"[:iter1 :time1 |"
	output cr.
	output nextPutAll: (t1 / scale) rounded printString.
	output nextPutAll: '     '.
	output nextPutAll: t2 printString.
	output nextPutAll: '     ' ].
	printB := [ :t1 :t2 | 
	"[:speed1 :slop1 |"
	output nextPutAll: (t1 / scale) rounded printString.
	output nextPutAll: '     '.
	output nextPutAll: t2 printString.
	output nextPutAll: '     ' ].
	printC := [ :t1 | 
	":expln1 |"
	output nextPutAll: t1 ].
	output
		nextPutAll:
			'

1000s    time    1000s of
itera-   sec-    iterations   slop-
tions    onds    per sec      stones   explanation
'.
	1 to: nTests do: [ :i | 
		param := testParams at: i.
		count := param at: 1.	"repetitions of a test inside its block"
		speed0 := (param at: 2) * scale.	"iters/sec for a one-slopstone machine"
		expln := param at: 3.
		block := testBlocks at: i.
		time := Time millisecondsToRun: [ n timesRepeat: block ].
		time := (time max: 1) / 1000.0.	"time is now in seconds"
		iter := count * n.
		speed := iter / time.
		stone := speed / speed0.
		iters add: iter.
		times add: time.
		speeds add: speed.
		stones add: stone.
		printA value: iter value: time.
		printB value: speed value: stone.
		printC value: expln ].
	geoMean := [ :t1 | 
	"[:numbers |"
	gm := 1.
	power := 1 / nTests.	"t2 as number"
	t1 do: [ :t2 | gm := gm * (t2 raisedTo: power) ].
	gm ].
	output cr.
	printA value: (geoMean value: iters) value: (geoMean value: times).
	printB value: (geoMean value: speeds) value: (geoMean value: stones).
	printC value: 'geometric mean'.
	output
		cr;
		cr;
		nextPutAll: 'Benchmarks complete.';
		cr