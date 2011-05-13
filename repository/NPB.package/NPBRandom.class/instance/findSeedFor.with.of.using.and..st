as yet unclassified
findSeedFor: aRank with: numOfThreads of: totalRanNumbers using: seed and: aGenMult
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