helper
parseArguments: arguments
	| parser |
	parser := SMarkHarnessArgumentParser new.
	^ parser parse: arguments.