thread
run
   [ semaphore wait.
     token < 503 ] whileFalse: [
								nextThread takeToken: token - 1].
	
	token == 0 ifFalse: [ nextThread takeToken: token - 1 ]
					 ifTrue:  [ done value: name ]
					 
	
   