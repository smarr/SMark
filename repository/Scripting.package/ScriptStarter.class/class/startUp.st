accessing
startUp
	"startUp is invoked during startup.
	 ScriptStarter has to be registered in the SystemDirectory's StartUpList
	 See ScriptStarter>>install"
	
	| arguments scriptClassName |
	"First make sure that stdout output can be used if available."
	ScriptConsole detectAvailableMechanismForStdout.
	
	arguments := self getSystemAttributes.
	arguments size > 0
		ifTrue: [scriptClassName := arguments at: 1.
			self executeRunFor: scriptClassName with: arguments.]