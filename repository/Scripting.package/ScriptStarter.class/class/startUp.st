system startup entry
startUp
	"startUp is invoked during startup.
	 ScriptStarter has to be registered in the SystemDirectory's StartUpList
	 See ScriptStarter>>install"
	
	| arguments scriptClassName |
	"Ok, only, and really only during startup"
	IsResuming ifFalse: [ Transcript show: 'ScriptStarter did not execute a given script, since it assumes to be executed after a snapshot and not during startup.'.
		^ self. ].
	
	"First make sure that stdout output can be used if available."
	ScriptConsole detectAvailableMechanismForStdout.
	
	arguments := self getSystemAttributes.
	arguments size > 0
		ifTrue: [scriptClassName := arguments at: 1.
			self executeRunFor: scriptClassName with: arguments.]