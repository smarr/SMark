benchmarking
fannkuchRedux: n to: output
	| gen |
	gen := permGenFactory new: n.
   ^ self maxPfannkuchenTo: output with: gen.