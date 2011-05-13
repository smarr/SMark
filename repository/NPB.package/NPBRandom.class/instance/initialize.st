initialization
initialize
	tran := NPBRandom seed.
	amult := NPBIS amult.
	KS := 0.
	r23 := 0.5 raisedTo: 23.
	r46 := r23 raisedTo: 2.
	t23 := 2 raisedTo: 23.
	t46 := t23 raisedTo: 2.