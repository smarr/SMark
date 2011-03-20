as yet unclassified
benchWithMultipleCriteria
	| t1 t2 t3 |
	t3 := runner createTimer: 't3'.
	t3 start.
	
	(Delay forMilliseconds: 25) wait.
	
	t2:= runner createTimer: 't2'.
	t2 start.
	(Delay forMilliseconds: 15) wait.	
	
	t1 := runner createTimer: 't1'.  
	t1 start.
	(Delay forMilliseconds: 10) wait.
	
	
	t3 stop.
	t2 stop.
	t1 stop.    