hash
updateHashIndex
    | size |
    size := names size.
    1 to: size do: [: i |
      table add: (names at: i) put: i
    ]