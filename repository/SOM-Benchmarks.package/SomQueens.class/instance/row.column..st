queens
row: r column: c
        ^ (freeRows at: r) & (freeMaxs at: c + r) & (freeMins at: c - r + 8)
