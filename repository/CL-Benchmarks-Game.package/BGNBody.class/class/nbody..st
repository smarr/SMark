benchmark scripts
nbody: times
	"self nbody: 1000"
   | bodies |
	self flag: 'Move the output that is currently in un-executed blocks into some reporter functionality'.

   bodies := BGNBodySystem new initialize.
   [ ScriptConsole print: bodies energy. ].
   times timesRepeat: [bodies after: 0.01d0].
   [ ScriptConsole print: bodies energy. ]. 
   ^ bodies energy