as yet unclassified
run
	| mainTimer tPhase1 tPhase2 tKeyInit tVerify executionVerified |

	ScriptConsole println: ' Size: ', totalKeys asString, ' Iterations: ', NPBISBase maxIterations asString.
	
	mainTimer := runner createTimer: 'precise-total'.
	tPhase1 := runner createTimer: 'phase1'.
	tPhase2 := runner createTimer: 'phase2'.
	tKeyInit := runner createTimer: 'keyInit'.
	tVerify := runner createTimer: 'verifyCompletely'.
	
	NPBISBase passedVerification: 0.
	
	serial
		ifTrue: [
			tKeyInit start.
			self initKeys: NPBIS amult.
			tKeyInit stop. 
			
			self rank: 1. ]
		ifFalse: [
			self setupThreads.
			
			tKeyInit start.
			self do: #initKeys.
			tKeyInit stop.
			
			RankThread iteration: 1.
			self do: #step1.
			
			self resetMasterHist.
			
			self do: #step2.
			self partialVerify: 1].
		
	NPBISBase passedVerification: 0.
		
	mainTimer start.
		
	1 to: NPBIS maxIterations do: [:i | 
		serial
			ifTrue: [ self rank: i. ]
			ifFalse: [ 
				RankThread iteration: i.
				tPhase1 start.
				self do: #step1.
				tPhase1 stop.
				
				self resetMasterHist.
				
				tPhase2 start.
				self do: #step2.
				tPhase2 stop.
				
				self partialVerify: i]
		].
	
	mainTimer stop.
	
	tVerify start.
	self fullVerify.
	tVerify stop.
	
	executionVerified := ((NPBISBase passedVerification) == ((5 * NPBIS maxIterations) + 1)).
	executionVerified
		ifFalse: [ Error signal: 'Benchmark verification failed'].
		
	serial ifFalse: [ self do: #quit. ].
	^ executionVerified