script entry
run: arguments 
	RVMTester print: 'Hello World!'.
	arguments
		do: [:elem | RVMTester print: elem].
	SmalltalkImage current snapshot: false andQuit: true