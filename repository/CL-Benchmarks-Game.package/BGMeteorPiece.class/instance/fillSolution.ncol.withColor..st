as yet unclassified
fillSolution: aString ncol: ncol withColor: c 
    | offset |
    offset := row * ncol.
    mask bitsDo: [:k | aString at: offset + k put: c]