benchmarking
meteor: n
	| output |
	output := TextStream with: String new.
	self meteor: n to: output.
	^ output