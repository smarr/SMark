helper
substitutionPatterns
    | arr |
    arr := arrFact new: 11.
    arr at:  1 put: (arrFact with: 'B' with: '(c|g|t)').
    arr at:  2 put: (arrFact with: 'D' with: '(a|g|t)').
    arr at:  3 put: (arrFact with: 'H' with: '(a|c|t)').
    arr at:  4 put: (arrFact with: 'K' with: '(g|t)').
    arr at:  5 put: (arrFact with: 'M' with: '(a|c)').
    arr at:  6 put: (arrFact with: 'N' with: '(a|c|g|t)').
    arr at:  7 put: (arrFact with: 'R' with: '(a|g)').
    arr at:  8 put: (arrFact with: 'S' with: '(c|g)').
    arr at:  9 put: (arrFact with: 'V' with: '(a|c|g)').
    arr at: 10 put: (arrFact with: 'W' with: '(a|t)').
    arr at: 11 put: (arrFact with: 'Y' with: '(c|t)').
    ^ arr