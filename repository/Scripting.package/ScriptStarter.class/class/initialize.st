initialization
initialize
	"Automatically install ScriptStarter when the code is filed in."
	self install.
	
	QuitVM := true.
	SafeBeforeQuit := false.
	IsResuming := false.