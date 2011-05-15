benchmark scripts
nbody: times
	"self nbody: 1000"
   | bodies |
   bodies := BGNBodySystem new initialize.
   RVMOperations print: bodies energy.
   times timesRepeat: [bodies after: 0.01d0].
   RVMOperations print: bodies energy.
   ^ bodies energy