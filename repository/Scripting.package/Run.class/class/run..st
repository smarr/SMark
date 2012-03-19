script entry
run: args
	| str cmdClass |
	ScriptStarter quitVMAfterScriptExecution: false.
	
	cmdClass := args removeFirst.
	str := args reduce: [:a :b | a asString, ' ', b asString ].
	ScriptConsole println: str.
	ScriptConsole println: args asString.
	ScriptConsole println: 'Going to evaluate the string'.
	[ Compiler evaluate: str. ]
		ifError: [:err :rcvr | ScriptConsole println: 'Error: ', err].