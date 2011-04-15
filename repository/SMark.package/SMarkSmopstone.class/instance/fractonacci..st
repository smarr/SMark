benchmarking
fractonacci: n 
	"Return something like the fibonacci function of n but
	using fractional numbers rather than whole ones. The
	reason for this variation is to run long enough to get
	a decent time measurement without exceeding 16383, the
	limit of small integers for ST/V-DOS. Choosing n = 13/2
	takes enough time and computes to 13581.

	Fibonacci uses n-1 and n-2 instead of n-(1/2) and n-(1/3).
	However, I couldn't get it to run in the above constraints.

	This benchmark tests the efficiency of recursively calling
	a method that does a little fractional arithmetic internally."

	^n > 1
		ifTrue: [(self fractonacci: n - (1/2)) + (self fractonacci: n - (1/3))]
		ifFalse: [1]