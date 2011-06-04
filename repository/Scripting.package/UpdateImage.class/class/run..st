script entry
run: args
	| proc |

	"The loading needs to be done after everything in startup has been done.
	 Otherwise the snaphost routine gets confused.
	 Thus, we do that ourselfs."
	ScriptStarter quitVMAfterScriptExecution: false.
	
	"Use a delayed process to do the actual work"
	proc := [ (Delay forSeconds: 5) wait.
	  "Create an up-to-date image"
	  (FileStream readOnlyFileNamed: 'FileInAllRenaissanceCode.st') fileIn.
	Transcript show: 'Snapshot and Quit now...'. 
	 Smalltalk snapshot: true andQuit: true. ] newProcess.

	proc name: 'Update Image'.
	proc resume.
	