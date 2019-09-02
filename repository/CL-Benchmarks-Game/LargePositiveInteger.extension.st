Extension { #name : #LargePositiveInteger }

{ #category : #'*CL-Benchmarks-Game-Meteor-bit manipulation' }
LargePositiveInteger >> bitCount [
    "Count the number of bits set to 1 in self"

    | bitCount |
    bitCount := 0.
    1 to: self digitLength do: [:i |
        bitCount := bitCount + (self digitAt: i) bitCountOfByte].
    ^bitCount
]

{ #category : #'*CL-Benchmarks-Game-Meteor-bit manipulation' }
LargePositiveInteger >> bitReverse: highBit [ 
    "This implementation is faster than super"
    
    | digitSize reversed |
    highBit < self highBit ifTrue: [ self error: 'Not enough bits.' ].
    digitSize := highBit + 7 // 8.
    reversed := self class basicNew: digitSize.
    1 to: self digitLength do: [:i |
        reversed digitAt: digitSize + 1 - i put: (self digitAt: i) byteReversed].
    ^reversed bitShift: highBit - (digitSize * 8)
]

{ #category : #'*CL-Benchmarks-Game-Meteor-bit manipulation' }
LargePositiveInteger >> bitsDo: aBlock [
    | mask offset |
    1 to: self digitLength do: [:iByte |
        offset := iByte - 1 bitShift: 3.
        mask := self digitAt: iByte.
        [mask = 0]
            whileFalse:
                [aBlock value: mask lowBit + offset.
                mask := mask bitAnd: mask - 1]]
]
