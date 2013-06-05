benchmarking
meteor: n
	| output |
	output := TextStream with: ByteString new.
	self new meteor: n to: output.
	^ output