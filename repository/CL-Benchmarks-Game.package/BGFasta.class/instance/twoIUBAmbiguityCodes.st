benchmarking
twoIUBAmbiguityCodes
	| arr |
	arr := arrayFactory new: 15.
	arr at:  1 put: (arrayFactory with: $a with: 0.27d0).
	arr at:  2 put: (arrayFactory with: $c with: 0.12d0).
	arr at:  3 put: (arrayFactory with: $g with: 0.12d0).
	arr at:  4 put: (arrayFactory with: $t with: 0.27d0).
	
	arr at:  5 put: (arrayFactory with: $B with: 0.02d0).
	arr at:  6 put: (arrayFactory with: $D with: 0.02d0).
	arr at:  7 put: (arrayFactory with: $H with: 0.02d0).
	arr at:  8 put: (arrayFactory with: $K with: 0.02d0).
	
	arr at:  9 put: (arrayFactory with: $M with: 0.02d0).
	arr at: 10 put: (arrayFactory with: $N with: 0.02d0).
	arr at: 11 put: (arrayFactory with: $R with: 0.02d0).
	arr at: 12 put: (arrayFactory with: $S with: 0.02d0).
	
	arr at: 13 put: (arrayFactory with: $V with: 0.02d0).
	arr at: 14 put: (arrayFactory with: $W with: 0.02d0).
	arr at: 15 put: (arrayFactory with: $Y with: 0.02d0).
	
	self
      writeFasta: 'TWO IUB ambiguity codes'
      from:
         ((randomStreamFact to: n*3 on: arr)
          random: r;
         	yourself).