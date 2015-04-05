adding
addToGraph
	"Add myself to the constraint graph."

	v1 addConstraint: self.
   v2 addConstraint: self.
   scale addConstraint: self.
   offset addConstraint: self.
   direction := nil.
