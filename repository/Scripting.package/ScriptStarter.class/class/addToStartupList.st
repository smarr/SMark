system startup entry
addToStartupList
	"Needs to be called after fileing in this code and activate the ScriptStarter on VM startup.
	 This should happen automatically, since 'self initialize' should get triggered.
	
	 Otherwise do: ScriptStarter addToStartupList
	"
	Smalltalk addToStartUpList: ScriptStarter