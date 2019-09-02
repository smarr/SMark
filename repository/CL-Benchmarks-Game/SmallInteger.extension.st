Extension { #name : #SmallInteger }

{ #category : #'*CL-Benchmarks-Game-Meteor-bit manipulation' }
SmallInteger >> bitCount [
    | count remainder |
    count := 0.
    remainder := self.
    [count := count + (BGBitOps bitCountOfByte: (remainder bitAnd: 255)).
    remainder > 255]
        whileTrue:
            [remainder := remainder bitShift: -8].
    ^count
]

{ #category : #'*CL-Benchmarks-Game-Meteor-bit manipulation' }
SmallInteger >> bitReverse: highBit [ 
    | v r s |
    highBit < self highBit ifTrue: [ self error: 'Not enough bits.' ].
    v := self.
    r := v bitAnd: 1.
    s := highBit - 1.
    [ v := v bitShift: -1.
    v = 0 ] whileFalse:
        [ r := r bitShift: 1.
        r := r bitOr: (v bitAnd: 1).
        s := s - 1 ].
    ^ r bitShift: s
]

{ #category : #'*CL-Benchmarks-Game-Meteor-bit manipulation' }
SmallInteger >> bitsDo: aBlock [
    | mask |
    self < 0 ifTrue: [^self error: 'Cannot enumerate bits of a negative integer'].
    mask := self.
    [mask = 0]
        whileFalse:
            [aBlock value: mask lowBit.
            mask := mask bitAnd: mask - 1]
]
