running
exec
	     ScriptConsole << (('Starting ', self name), ' benchmark ... ').
        self warmup.
        total := self doRuns.