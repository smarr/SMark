running
cleanUpInstanceVariables
	"Make sure all variables that are 'user variables' get cleaned"
	
	(self class allInstVarNames copyWithoutAll: self instanceVariablesToPreserve) do: [ :name |
		self instVarNamed: name put: nil ]