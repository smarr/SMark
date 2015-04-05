adding
removeFromGraph
	"Remove myself from the constraint graph."

	(v1 == nil) ifFalse: [v1 removeConstraint: self].
	(v2 == nil) ifFalse: [v2 removeConstraint: self].
	(scale == nil) ifFalse: [scale removeConstraint: self].
	(offset == nil) ifFalse: [offset removeConstraint: self].
	direction := nil.
