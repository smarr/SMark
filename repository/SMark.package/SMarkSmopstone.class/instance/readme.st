benchmarking
readme
   "STEFAN: use the original benchmarks, but do not use original way
            of reporting results. Rely on the SMark reporting instead."

	"INTRODUCTION 
	 
	Smopstone: Smalltalk Medium level OPeration Stones 
	Portable Medium level Benchmarks for ST80 and ST/V (using 16-bit 
	SmallInts) Placed in public domain January 1993  (c) Bruce Samuelson 
	Permission is given to place this in public Smalltalk archives 
	 
	Use monospaced fonts if possible to view the methods in this class. 
	 
	(1) Collect garbage if supported (2) do 'SmopstoneBenchmark new 
	runBenchmark'. Results are printed in the Transcript window. 
	Post results for your machines to comp.lang.smalltalk or 
	mail them to bruce@ling.uta.edu or bruce@utafll.uta.edu. 
	 
	DISCUSSION 
	    
	This readme method would normally be in the class comment for ST80. 
	ST/V-DOS doesn't support class comments. 
	 
	These benchmarks are a companion to the SlopstoneBenchmark class 
	posted to 
	comp.lang.smalltalk this month. Slopstones tested low level operations. 
	  
	Smopstones test medium level operations that exercise recursive block 
	and  
	method calls, collection building and enumeration, streaming, and 
	sorting. The 
	lower level operations contained in them exercise arithmetic (mostly 
	integer, with some fractions and floats) string manipulation, and low 
	level streaming. 
	 
	The benchmarks do not test applications. They also do not test user 
	interface performance because of the non-portability of this area of 
	Smalltalk and its  
	sensitivity to the speed of the video subsystem. The tests are cpu bound. 
	They do not access files and should not cause disk paging. 
	 
	The main weaknesses of the benchmarks are (1) they are not high 
	enough level 
	to test actual applications, and (2) they concentrate in too few areas of 
	Smalltalk, omitting many of the diverse capabilities of its class library. 
	My excuse is that one can only devote limited time writing public 
	domain benchmarks. 
	 
	The tests avoid generating integers larger than 16383, the maximum 
	SmallInteger in ST/V-DOS. 16-bit implementions would perform worse 
	with larger 
	integers. The benchmarks are also suitable for testing 32-bit versions of 
	Smalltalk. They try to avoid other pitfalls that would skew the results 
	such as the lack of an adequate hash function for a class. Someone 
	warned of this 
	in comp.lang.smalltalk (I forget who). 
	 
	DEFINITION OF REFERENCE MACHINE (ONE SMOPSTONE) 
	 
	The following machine is the one on which I developed these 
	benchmarks. By 
	convention it is defined to operate at one smopstone. It's a mid range 
	performer for current ParcPlace versions of Smalltalk. 
	 
	Hardware: Amax 486DX/33 (includes internal floating point processor 
	and internal 8K cache), 256K external cache, 16MB RAM. 
	 
	Software: ParcPlace VisualWorks 1.0, Windows 3.1, DOS 5.0 (plain vanilla 
	setup). 
	 
	COMPARISON TO XEROX DORADO 
	 
	For reference, the machine runs at 649% of a Dorado on ParcPlace 
	benchmarks for ST80 4.1. Its fast video card helps on these PPS 
	benchmarks. I didn't run 
	them for VisualWorks 1.0. It would be somewhat slower because there 
	are vastly 
	more classes. 
	 
	EXAMPLE RESULTS FOR REFERENCE MACHINE 
	 
	time in    smop- 
	seconds    stones    explanation 
	 
	 
	3.157      1.0       generating fractonaccis 
	1.123      1.0       generating primes 
	1.091      1.0       generating and parsing streams 
	3.091      1.0       generating strings 
	1.167      1.0       forming sets 
	5.139      1.0       sorting strings 
	5.601      1.0       sorcerer's apprentice 
	 
	2.355      1.0       geometric mean"
	^ self