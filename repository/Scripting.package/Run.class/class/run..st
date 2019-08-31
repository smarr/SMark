script entry
run: args
	| str |
	ScriptStarter quitVMAfterScriptExecution: false.
	
	args removeFirst. "command class"
	str := args reduce: [:a :b | a asString, ' ', b asString ].
	ScriptConsole println: str.
	ScriptConsole println: args asString.
	ScriptConsole println: 'Going to evaluate the string'.
	[ self compiler evaluate: str. ]
		ifError: [:err :rcvr | ScriptConsole println: 'Error: ', err].