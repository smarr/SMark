benchmarking
meteor: n
	| output |
	output := TextStream with: String new.
	self new meteor: n to: output.
	^ output