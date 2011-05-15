system startup entry
uninstall
	"Will remove ScriptStarter from the StartUpList"
	Smalltalk removeFromStartUpList: ScriptStarter.
	
	self flag: 'TODO: restore original setting for readDocumentAtStartup, see >>install.'.
	Transcript show: 'You might need to restore the original setting for readDocumentAtStartup'.