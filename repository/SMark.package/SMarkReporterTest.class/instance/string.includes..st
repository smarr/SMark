compatibility Pharo 1.4 vs. 2.0
string: str includes: subStr
	"To be compatible with Pharo 1.4 and 2.0"
	(str respondsTo: #includesSubstring:)
		ifTrue:  [ ^ str includesSubstring: subStr ] "2.0"
		ifFalse: [ ^ str includesSubString: subStr ] "1.4"