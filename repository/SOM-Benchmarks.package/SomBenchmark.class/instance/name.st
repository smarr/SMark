accessing
name
	| className |
	"Remove Som prefix"
	className := self class name asString.
	^  className copyFrom: 4 to: className size