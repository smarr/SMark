instance creation
named: anInteger next: aThread done: completionBlock
   ^ self new 
			name: anInteger;
			nextThread: aThread;
			done: completionBlock;
			fork