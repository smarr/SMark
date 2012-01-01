benchmark scripts
nbody: times with: bodies
	"self nbody: 1000"
   | initEnergy finalEnergy |

	initEnergy := bodies energy.

   times timesRepeat: [bodies after: 0.01d0].
	
	finalEnergy := bodies energy.
	
   ^ {initEnergy. finalEnergy}