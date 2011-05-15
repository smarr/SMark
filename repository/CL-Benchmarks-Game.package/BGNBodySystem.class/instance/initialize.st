initialize-release
initialize
   bodies := OrderedCollection new
      add: BGBody sun; add: BGBody jupiter; add: BGBody saturn;
      add: BGBody uranus; add: BGBody neptune; yourself.

   bodies first offsetMomentum:
      (bodies inject: (Array with: 0.0d0 with: 0.0d0 with: 0.0d0)
         into: [:m :each | each addMomentumTo: m])