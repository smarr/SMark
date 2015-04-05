benchmarking
benchmark
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