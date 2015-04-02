adding
removeFromGraph
	"Remove myself from the constraint graph."

	(output == nil) ifFalse: [output removeConstraint: self].
	satisfied := false.