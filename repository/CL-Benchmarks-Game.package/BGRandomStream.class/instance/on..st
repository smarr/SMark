initialize-release
on: aCollection
   | size cp |
	self initialize.
	
   repeatPtr := 0.
   random := randomNumFactory to: 1.0d0.
   size := aCollection size.
   percentages := Array new: size.
   collection := Array new: size.
   cp := 0.0d0.
   1 to: size do: [:i|
      collection at: i put: (aCollection at: i) first.
      percentages at: i put: (cp := cp + (aCollection at: i) last).
   ]