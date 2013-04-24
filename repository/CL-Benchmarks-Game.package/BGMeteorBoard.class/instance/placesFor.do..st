generating
placesFor: aPieceMask do: aBlock
    | westMask eastMask |
    eastMask := self shiftSEmost: aPieceMask.
    
    [[westMask := eastMask.
    [westMask lowBit > twoRows ifTrue: [^self].
    (self hasEastOrWestIsland: westMask) ifFalse: [aBlock value: westMask].
    self canShiftW: westMask] whileTrue: [westMask := self shiftW: westMask].
    self canShiftNE: eastMask] whileTrue: [eastMask := self shiftNE: eastMask].
    self canShiftNW: eastMask] whileTrue: [eastMask := self shiftNW: eastMask]