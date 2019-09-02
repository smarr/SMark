Class {
	#name : #NPBRandom,
	#superclass : #Object,
	#instVars : [
		'tran',
		'amult',
		'KS',
		'r23',
		'r46',
		't23',
		't46'
	],
	#category : 'NPB'
}

{ #category : #'as yet unclassified' }
NPBRandom class >> d2m46 [
	^ 0.5 raisedTo: 46
]

{ #category : #'as yet unclassified' }
NPBRandom class >> i246m1 [
	^ (2 raisedTo: 46) - 1
]

{ #category : #'as yet unclassified' }
NPBRandom class >> seed [
	^314159265.0
]

{ #category : #'as yet unclassified' }
NPBRandom >> findSeedFor: aRank with: numOfThreads of: totalRanNumbers using: seed and: aGenMult [
	| i t1 t2 an 
	 mq nq kk ik continueLoop |

	nq := (totalRanNumbers / numOfThreads) asInteger.
	mq := 0.

	[nq > 1] whileTrue: [
		mq := mq + 1.
		nq := nq / 2.
	].

	t1 := aGenMult.
	
	1 to: mq do: [ :ii |
		tran := t1.
		t2 := self randlc: t1.
		t1 := tran.
	].

	an := t1.
	
	kk := aRank.
	t1 := seed.
	t2 := an.

	i := 1.
	
	continueLoop := true.
	[(i <= 100) and: continueLoop] whileTrue: [
		ik := (kk / 2) asInteger.
		
		((2 * ik) ~= kk) ifTrue: [
			tran := t1.
			self randlc: t2.
			t1 := tran.].
		
		(ik == 0) ifTrue: [ continueLoop := false. ]
		ifFalse: [
			tran := t2.
			self randlc: t2.
			t2 := tran.
			kk := ik.
			i := i + 1.
			].
	].
   
	^ t1.
]

{ #category : #initialization }
NPBRandom >> initialize [
	tran := NPBRandom seed.
	amult := NPBIS amult.
	KS := 0.
	r23 := 0.5 raisedTo: 23.
	r46 := r23 raisedTo: 2.
	t23 := 2 raisedTo: 23.
	t46 := t23 raisedTo: 2.
]

{ #category : #license }
NPBRandom >> license [
	^'This code is based on the Java version of NPB3.

Permission to use, copy, distribute and modify this software for any purpose
with or without fee is hereby granted. We request, however, that all derived
work reference the NAS Parallel Benchmarks 3.0. This software is provided "as
is" without express or implied warranty.

Information on NPB 3.0, including the Technical Report NAS-02-008
"Implementation of the NAS Parallel Benchmarks in Java", original
specifications, source code, results and information on how to submit new
results, is available at:

   http://www.nas.nasa.gov/Software/NPB/'
]

{ #category : #'as yet unclassified' }
NPBRandom >> randlc: aDouble [
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
]

{ #category : #accessing }
NPBRandom >> seed [
	^ tran
]

{ #category : #'private - accessing' }
NPBRandom >> seed: aSeed [
	tran := aSeed
]
