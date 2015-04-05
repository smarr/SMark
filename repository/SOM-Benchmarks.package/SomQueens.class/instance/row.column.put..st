queens
row: r column: c put: v
        freeRows at: r         put: v.
        freeMaxs at: c + r     put: v.
        freeMins at: c - r + 8 put: v