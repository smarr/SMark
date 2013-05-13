stone benchmarks
streamTestsOn: integers 
	"modified by nishis"
	"Test steaming operations on the collection of integers. 
	 
	This method measures the efficiency of integer-to-float conversion, of 
	printing numbers to a write stream, of parsing tokens in a read 
	stream,   and of converting the tokens from strings to numbers. The 
	technique for 
	converting tokens into floats is constrained by portability between 
	ST80 and ST/V. 
	 
	To validate the logic, the original integers are compared with the 
	final   floats. There should be no roundoff errors."
	"The following line accounts for the different implementations of 
	Float>>printString for some versions of Smalltalk. USA versions use 
	the decimal character, while some European versions use the comma 
	char.   Thanks to Marten Feldtmann for pointing this out."

	| delim space s floats float string |
	delim := 1.0 printString at: 2.	"$. for USA, $, for some Europe."

	space := Character value: 32.
	"Can't use Character space in ST/V-DOS"
	s := ReadWriteStream on: String new.
	integers do: 
		[:i |
			i asFloat printOn: s.
			s space].
	"Now make sure the underlying string size is < 16383, a 16-bit small int."
	s contents size > (SmallInteger maxVal) ifTrue: [self error: 'String too big.'].
	s reset.
	floats := ordCollectionFact new: integers size.
	[s atEnd]
		whileFalse: 
			[float := 0.0.
			string := s upTo: delim.
			s upTo: space.
			"In the following, digitValue is portable between ST80 and ST/V-DOS. "
			string do: [:char | float := float * 10.0 + char digitValue].
			floats add: float].
	integers = floats ifFalse: [self error: 'Numbers do not compare.']