as yet unclassified
randlc: aDouble
	| t1 t2 t3 t4 a1 a2 x1 x2 z |
	" Break A into two parts such that A = 2**23 * A1 + A2. "

	t1 := r23 * aDouble.
	a1 := t1 asInteger.
	a2 := aDouble - (t23 * a1).
	
	" Break X into two parts such that X = 2^23 * X1 + X2, compute
	  Z = A1 * X2 + A2 * X1  (mod 2^23), and then
	  X = 2^23 * Z + A2 * X2  (mod 2^46). "

	t1 := r23 * tran.
	x1 := t1 asInteger.
	x2 := tran - (t23 * x1).
	t1 := (a1 * x2) + (a2 * x1).
	t2 := (r23 * t1) asInteger.
	z := t1 - (t23 * t2).
	t3 := (t23 * z) + (a2 * x2).
	t4 := (r46 * t3) asInteger.
	tran := t3 - (t46 * t4).
	^ r46 * tran