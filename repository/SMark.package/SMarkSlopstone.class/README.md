modified for Squeak by nishis@urban.ne.jp
I added one class methods.
and modified execute method.  block variables are renamed for Squeak.
Thanx to Mr. Tim Olson, Mr. Kohler Markus, Mr. Tim Rowledge, Mr. John Maloney, Mr. Ian Piumarta.

original comments
	NAME			STones80
	AUTHOR			bruce@utafll.uta.edu (Bruce Samuelson)
	FUNCTION		low and medium level benchmarks for ST80 and ST/V
	ST-VERSIONS		pre R4.0, R4.0, R4.1, ST/V
	PREREQUISITES	need floating point hardware or emulation
	CONFLICTS		none
	DISTRIBUTION	world
	VERSION			1.0
	DATE			April 16, 1993

SUMMARY The filein includes two classes: Slopstones (Smalltalk Low level
OPeration Stones) and Smopstones (Smalltalk Medium level OPeration Stones).
Each includes seven cpu intensive benchmarks. They work equally well with
16-bit and 32-bit implementations and are designed to be portable to all
Smalltalk versions from ParcPlace and Digitalk. They are normalized to the
author's 486/33 Windows 3.1 machine running ParcPlace VisualWorks 1.0.
Results have been posted to the Usenet group comp.lang.smalltalk and form the
basis of an article that is scheduled to be published in the June issue of The
Smalltalk Report.

The only difference between the ST80 (STones80) and ST/V (STonesV) filein is
in the messages that define the classes in the first few lines of code. The
ST80 messages specify the class category and message protocol, which are not
used in ST/V.

Bruce Samuelson

