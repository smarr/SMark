timing
currentMillis
	"hack to make it work under most Smalltalkses and Pinocchio"
	<pPrimitive: #millisecondClock plugin: #'Chronology.Time' >
	^ Time millisecondClockValue