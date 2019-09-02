Class {
	#name : #SomBounce,
	#superclass : #SomBenchmark,
	#category : 'SOM-Benchmarks'
}

{ #category : #benchmarking }
SomBounce >> benchmark [
        | ballCount balls bounces |
        SomRandom initialize.
        
        ballCount := 100.
        bounces   := 0.
        balls     := Array new: ballCount.
        1 to: balls size do: [:i | balls at: i put: SomBall new ].
        
        1 to: 50 do: [ :i |
            balls do: [ :ball |
                (ball bounce) ifTrue: [ bounces := bounces + 1 ] ] ].

        ^ bounces
]

{ #category : #benchmarking }
SomBounce >> verifyResult: result [
      ^ self assert: 1331 equals: result
]
