as yet unclassified
advance: dt
        1 to: bodies size do: [:i |
            | iBody |
            iBody := bodies at: i.

            i + 1 to: bodies size do: [:j |
                | dx dy dz jBody dSquared distance mag |
                jBody := bodies at: j.
                dx := iBody x - jBody x.
                dy := iBody y - jBody y.
                dz := iBody z - jBody z.

                dSquared := (dx * dx) + (dy * dy) + (dz * dz).
                distance := dSquared sqrt.
                mag      := dt / (dSquared * distance).

                iBody vx: iBody vx - (dx * jBody mass * mag).
                iBody vy: iBody vy - (dy * jBody mass * mag).
                iBody vz: iBody vz - (dz * jBody mass * mag).

                jBody vx: jBody vx + (dx * iBody mass * mag).
                jBody vy: jBody vy + (dy * iBody mass * mag).
                jBody vz: jBody vz + (dz * iBody mass * mag).
            ].
       ].
       
       bodies do: [:body |
           body x: body x + (dt * body vx).
           body y: body y + (dt * body vy).
           body z: body z + (dt * body vz).
       ].