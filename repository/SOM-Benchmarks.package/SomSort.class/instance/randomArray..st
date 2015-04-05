initializing
randomArray: size
        | array |
        SomRandom initialize.
        array := Array new: size.
        1 to: size do: [:i | array at: i put: SomRandom next ].
        smallest := largest := array at: 1.
        array do: [ :elm |
            (elm > largest)  ifTrue: [ largest  := elm ].
            (elm < smallest) ifTrue: [ smallest := elm ]. ].
        ^array