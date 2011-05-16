helper
parseArguments: arguments
	| parser |
	parser := ReBenchHarnessArgumentParser new.
	parser harness: self.  
	^ parser parse: arguments.