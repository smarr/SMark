benchmarking
fannkuchRedux: n to: output
	| gen |
	gen := BGPermGeneratorRedux new: n.
   ^ self maxPfannkuchenTo: output with: gen.