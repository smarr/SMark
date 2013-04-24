solving
boardStringWithPieces: pArray
    | board |
    board := String new: ncell.
    1 to: pArray size do: [:i | | c |
        c := '0123456789*' at: i.
        (pArray at: i) fillSolution: board ncol: ncol withColor: c].
    ^board