script entry
run: arguments 
	ScriptConsole print: 'Hello World!'.
	arguments
		do: [:elem | ScriptConsole print: elem].
	SmalltalkImage current snapshot: false andQuit: true