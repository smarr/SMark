benchmarking
fasta: n to: out
   | r lineLength bench |

	bench := self new.
	bench n: n.
	bench out: out.
	bench oneHomoSapiensAlu.
	
   bench r: (BGRandomNumber to: 1). "Shared random sequence"

	bench twoIUBAmbiguityCodes.
	bench threeHomoSapiensFrequency.
	
	out flush.