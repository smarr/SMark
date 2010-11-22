script entry
run: arguments 
	RVMPrimitives printOnConsole: 'Hello World!'.
	arguments
		do: [:elem | RVMPrimitives printOnConsole: elem].
	SmalltalkImage current snapshot: false andQuit: true