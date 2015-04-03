as yet unclassified
maxPfannkuchen
        | max permutation |
        max := 0.
        [self atEnd] whileFalse: [
            permutation := self next.
            max := max max: (self pfannkuchen: permutation)].
        ^max