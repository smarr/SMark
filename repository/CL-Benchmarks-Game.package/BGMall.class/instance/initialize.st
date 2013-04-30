initialize-release
initialize
	super initialize.
	self initializeFactories.
   guard := Semaphore forMutualExclusion.
   queue := sharedQueueFactory new.
   cache := orderedCollectionFactory new.
   1 to: 10 do: [:x | cache add: pairFactory new].