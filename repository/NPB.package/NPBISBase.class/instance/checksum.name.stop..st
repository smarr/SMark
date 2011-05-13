as yet unclassified
checksum: intArray name: aString stop: aBool
	| check |
	
	check := intArray sum.
	1 halt.
	"RVMOperations print: name, ' checksum is ', check asString."
	
	aBool ifTrue: [
		1 halt.
		self StopSystemHere]