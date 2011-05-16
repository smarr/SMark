helper
parseArguments: arguments
	| parser |
	parser := ReBenchHarnessArgumentParser new.
	^ parser parse: arguments.