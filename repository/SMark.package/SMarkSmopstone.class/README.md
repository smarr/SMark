modified for Squeak by nishis@urban.ne.jp
see the comment of SlopstoneBenchmark class.
I added all class methods and initialization>initilize method,
modified:
	streamTestsOn: method.  In some case use testPrintOn: s base: instead of printOn:,
	primesUpTo: method. From recursively calling a block to whileTrue: block.
	sorcerersApprentice method. From recursively calling a block to  recursive method.
	execute and setup method.
Thanx to Mr. Tim Olson, Mr. Kohler Markus, Mr. Tim Rowledge, Mr. John Maloney, Mr. Ian Piumarta.

originak code by
	NAME			STones80
	AUTHOR			bruce@utafll.uta.edu (Bruce Samuelson)
	FUNCTION		low and medium level benchmarks for ST80 and ST/V
	ST-VERSIONS		pre R4.0, R4.0, R4.1, ST/V
	PREREQUISITES	need floating point hardware or emulation
	CONFLICTS		none
	DISTRIBUTION	world
	VERSION			1.0
	DATE			April 16, 1993

