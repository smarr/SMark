as yet unclassified
expectedResult: problemSize
      results isNil ifTrue: [
        results := Array new: 12.
        results at:  1 put:  0.
        results at:  2 put:  1.
        results at:  3 put:  2.
        results at:  4 put:  4.
        results at:  5 put:  7.
        results at:  6 put: 10.
        results at:  7 put: 16.
        results at:  8 put: 22.
        results at:  9 put: 30.
        results at: 10 put: 38.
        results at: 11 put: 51.
        results at: 12 put: 65.
      ].
      ^ results at: problemSize