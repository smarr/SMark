sorting
sort: array low: low high: high
        | pivot i j |
        
        pivot := array at: (low + high) // 2.
        i := low.
        j := high.
        [ i <= j ]
            whileTrue: [
                [ (array at: i) < pivot ] whileTrue: [ i := i + 1 ].
                [ pivot < (array at: j) ] whileTrue: [ j := j - 1 ].
                ( i <= j )
                    ifTrue: [
                        | tmp |
                        tmp := array at: i.
                        array at: i put: (array at: j).
                        array at: j put: tmp.
                        i := i + 1.
                        j := j - 1. ] ].
        
        (low < j)  ifTrue: [ self sort: array low: low high: j  ].
        (i < high) ifTrue: [ self sort: array low: i high: high ]
