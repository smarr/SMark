timing
currentMillis
	"hack to make it work under most Smalltalkses and Pinocchio"
	"STEFAN: had to take this out, since my images do not support pragmas
	 <pPrimitive: #millisecondClock plugin: #'Chronology.Time' >"
	^ Time millisecondClockValue