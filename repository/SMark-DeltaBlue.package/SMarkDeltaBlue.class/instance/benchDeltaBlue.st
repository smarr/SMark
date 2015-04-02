benchmarking
benchDeltaBlue
	"This the combined benchmark."
	
	| n |
	
	n := self problemSize.
	
	DBStrength initialize.
	DBPlanner chainTest: n.
	DBPlanner projectionTest: n.
	^ true