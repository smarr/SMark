initialize-release
initialize
	super initialize.
	self initializeFactories.
   guard := Semaphore forMutualExclusion.
   queue := SharedQueue new.
   cache := OrderedCollection new.
   1 to: 10 do: [:x | cache add: pairFactory new].