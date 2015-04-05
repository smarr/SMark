accessing
swap: i with: j
        | tmp |
        tmp := v at: i.
        v at: i put: (v at: j).
        v at: j put: tmp