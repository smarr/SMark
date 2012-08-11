scripting
run: arguments
	"This is the main entry when started as a script from the command line"
	| sel  |
	(arguments size < 2) ifTrue: [
		^ self usage.].

	sel := (arguments at: 2) asSymbol.
	sel = #runAllTests ifTrue: [
		^ self runAllTests.].
	
	(arguments size < 3) ifTrue: [
		^ self usage.].
	
	self perform: sel with: (arguments at: 3).
	