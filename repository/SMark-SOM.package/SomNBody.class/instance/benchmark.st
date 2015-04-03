as yet unclassified
benchmark
	     | bodies |
        bodies := NBNBodySystem new.
        
        1 to: self problemSize do: [:i |
            bodies advance: 0.01.
        ].
        
        self problemSize = 250000 ifTrue: [
          ^ bodies energy = -0.1690859889909308
        ].
        expectedEnergy isNil ifTrue: [
          expectedEnergy := bodies energy.
          ^ true
        ].
        
        ^ expectedEnergy = bodies energy.