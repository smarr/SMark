initialization
initialize
	afterCnt := 0.
	self initializeFactories.
	
	bodies := collectionFactory new add: bodyFactory sun;
				 add: bodyFactory jupiter;
				 add: bodyFactory saturn;
				 add: bodyFactory uranus;
				 add: bodyFactory neptune;
				 yourself.
	
	bodies first offsetMomentum: (bodies
				inject: (arrayFactory with: 0.0 with: 0.0 with: 0.0)
				into: [:m :each | each addMomentumTo: m])