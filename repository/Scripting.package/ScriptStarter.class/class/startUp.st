system startup entry
startUp
	"startUp is invoked during startup.
	 ScriptStarter has to be registered in the SystemDirectory's StartUpList
	 See ScriptStarter>>addToStartupList"
	
	| arguments scriptClassName |
	arguments := self getSystemAttributes.
	arguments size > 0
		ifTrue: [scriptClassName := arguments at: 1.
			self executeRunFor: scriptClassName with: arguments.]