pi digit generation
eliminate: digit
    accum := accum - (denom * digit).
    accum := accum * 10.
    numer := numer * 10