as yet unclassified
initialize
        | px py pz |

        bodies := Array new: 5.
        bodies at: 1 put: NBBody sun.
        bodies at: 2 put: NBBody jupiter.
        bodies at: 3 put: NBBody saturn.
        bodies at: 4 put: NBBody uranus.
        bodies at: 5 put: NBBody neptune.
        
        "bodies do: [:b | b print. '' println ]."

        px := 0.0.  py := 0.0.  pz := 0.0.

        bodies do: [:b |
            px := px + (b vx * b mass).
            py := py + (b vy * b mass).
            pz := pz + (b vz * b mass).
        ].
        
        (bodies at: 1) offsetMomentumX: px y: py z: pz.
        
        "bodies do: [:b | b print. '' println ]."